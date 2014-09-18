class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :user_round_predictions, :dependent => :destroy
  has_many :user_match_predictions, :dependent => :destroy
  has_many :user_tournament_scores, :dependent => :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, length: { maximum: 50, minimum: 3 }
  validates :username, :uniqueness => {:case_sensitive => false}

  validates_format_of :username, :with => /\A[A-Za-z\d_]+\Z/

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

end
