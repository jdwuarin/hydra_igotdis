class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :bets
  has_many :bet_histories
  has_one :user_account, :dependent => :delete

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :create_user_account

  private
    def create_user_account
      UserAccount.find_or_create_by(user: self)
    end


end
