# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :match do
    round
    date { DateTime.now }
    finished false
    receiving_contestant { round.receiving_contestant }
    invited_contestant { round.invited_contestant }
    results Hash.new
  end
end
