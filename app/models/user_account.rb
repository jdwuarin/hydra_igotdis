class UserAccount < ActiveRecord::Base
  belongs_to :user
  belongs_to :currency

  validates :user_id, presence: true

  before_create :default_play_money

  def default_play_money
    self.playe_money = 1000
  end
end
