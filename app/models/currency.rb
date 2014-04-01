class Currency < ActiveRecord::Base
  has_many :user_accounts
  validates :name, presence: true
end
