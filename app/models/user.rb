class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :user_match_predictions, :dependent => :destroy
  has_many :user_tournament_scores, :dependent => :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  validates :username, presence: true, length: { maximum: 50, minimum: 2 }
  validates :username, :uniqueness => {:case_sensitive => false}

  validates_format_of :username, :with => /\A[A-Za-z\d_]+\Z/

  after_create :create_user_tournament_scores

  attr_accessor :login

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(
        ["lower(username) = :value OR lower(email) = :value",
          { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def create_user_tournament_scores

    active_tournaments = Tournament.where("end_date > ?", Time.now)

    active_tournaments.each do |active_tournament|
      UserTournamentScore.create(user: self, tournament: active_tournament)
    end

  end

  TEMP_EMAIL_PREFIX = 'no_email@igotdis.gg'

  def self.find_for_oauth(auth, signed_in_resource = nil)

    # Get the identity and user if they exist
    identity = Identity.find_for_oauth(auth)

    # If a signed_in_resource is provided it always overrides the existing user
    # to prevent the identity being locked with accidentally created accounts.
    # Note that this may leave zombie accounts (with no associated identity) which
    # can be cleaned up at a later date.
    user = signed_in_resource ? signed_in_resource : identity.user

    # Create the user if needed
    if user.nil?

      # Get the existing user by email if the provider gives us a verified email.
      # If no verified email was provided we assign a temporary email and ask the
      # user to verify it on the next step via UsersController.finish_signup
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      user = User.where(:email => email).first if email

      # Create the user if it's a new registration
      if user.nil?
        user = User.new(
          name: auth.extra.raw_info.name,
          #username: auth.info.nickname || auth.uid,
          email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
          password: Devise.friendly_token[0,20]
        )
        user.skip_confirmation!
        user.save!
      end
    end

    # Associate the identity with the user if needed
    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end

end
