# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tournament do
    name "MyString"
    game_id 1
    start_date "2014-03-06 18:27:52"
    end_date "2014-03-06 18:27:52"
    venue_id 1
    continent_id 1
  end
end
