class UserAccount < ActiveRecord::Base
  belongs_to :user
  belongs_to :currency

  validates :user_id, presence: true

  before_create :set_default_play_money

  def recharge_play_money
    current_time = Time.now
    if self.play_money < 1000 && current_time - self.last_updated > 24.hours
      self.play_money = 1000
      self.save
    elsif self.play_money > 0
      self.errors[:has_money] << 'User account is not empty'
    else
      self.errors[:waiting_time] << 'User must wait at least 24 hours between recharges'
    end
  end

  private
    def set_default_play_money
      self.play_money = 1000
    end
end
