# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :player do
    username "MyString"
    first_name "MyString"
    last_name "MyString"
    position 1
    date_of_birth "2014-03-06"
    continent 1
  end
end
