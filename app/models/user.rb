class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :bets
  has_one :user_account

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


end
