# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :match do
    round
    date { DateTime.tomorrow }
    finished false
    receiving_contestant { create(:receiving_contestant, 
                           tournament: round.tournament) }
    invited_contestant { create(:invited_contestant, 
                         tournament: round.tournament) }
    results Hash.new
  end

  factory :LWC_group_stage_match, parent: :match do
    association :round, factory: :LWC_group_stage
    date { DateTime.new(2014, 9, 19).change(:offset => "+0200") }
    receiving_contestant { create(:LWC_receiving_contestant, 
                           tournament: round.tournament) }
    invited_contestant { create(:LWC_invited_contestant, 
                         tournament: round.tournament) }
  end

  factory :LWC_quarter_final_match, parent: :match do
    date { DateTime.new(2014, 10, 4).change(:offset => "+0200") }
    association :round, factory: :LWC_quarter_final
  end

  factory :LWC_semi_final_match, parent: :match do
    date { DateTime.new(2014, 10, 12).change(:offset => "+0200") }
    association :round, factory: :LWC_semi_final
  end

  factory :LWC_final_match, parent: :match do
    date { DateTime.new(2014, 10, 19, 10).change(:offset => "+0200") }
    association :round, factory: :LWC_final
  end

end
