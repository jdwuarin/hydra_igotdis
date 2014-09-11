# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :match do
    round
    date Datetime.now
    finished false
    receiving_contestant round.receivin_contestant
    invited_contestant round.invited_contestant
    results {}
  end
end
