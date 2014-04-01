class UserAccount < ActiveRecord::Base
  belongs_to :user
  belongs_to :currency

  validates :user_id, presence: true
end
