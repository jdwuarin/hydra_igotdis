FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  sequence :name do |n|
    "Example name #{n}"
  end

  sequence :username do |n|
    "username_eg_#{n}"
  end

end