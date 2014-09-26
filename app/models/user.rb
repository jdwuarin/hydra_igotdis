class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :user_match_predictions, :dependent => :destroy
  has_many :user_tournament_scores, :dependent => :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

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

end
