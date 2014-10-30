class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :user_match_predictions, :dependent => :destroy
  has_many :user_tournament_scores, :dependent => :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  validates :username, length: { maximum: 50, minimum: 2 }, :allow_blank => true
  validates :username, :uniqueness => {:case_sensitive => false}

  validates_format_of :username, :with => /\A(|[A-Za-z\d_])+\Z/

  after_create :create_user_tournament_scores
  before_save  :ensure_authentication_token

  attr_accessor :login

  def create_user_tournament_scores

    active_tournaments = Tournament.where("end_date > ?", Time.now)

    active_tournaments.each do |active_tournament|
      UserTournamentScore.create(user: self, tournament: active_tournament)
    end

  end

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

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  private

    def generate_authentication_token
      loop do
        token = Devise.friendly_token
        break token unless User.where(authentication_token: token).first
      end
    end


end
