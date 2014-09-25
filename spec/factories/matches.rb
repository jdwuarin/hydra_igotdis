# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :match do
    round
    date { DateTime.tomorrow }
    finished false
    receiving_contestant
    invited_contestant
    results Hash.new
  end

  factory :LWC_group_stage_match, parent: :match do
    association :round, factory: :LWC_group_stage
    association :receiving_contestant, factory: :LWC_receiving_contestant
    association :invited_contestant, factory: :LWC_invited_contestant
  end

  factory :LWC_quarter_final_match, parent: :match do
    association :round, factory: :LWC_quarter_final
  end

  factory :LWC_semi_final_match, parent: :match do
    association :round, factory: :LWC_semi_final
  end

  factory :LWC_final_match, parent: :match do
    association :round, factory: :LWC_final
  end

end
