FactoryGirl.define do
  factory :event do
      name            { Faker::LeagueOfLegends.champion }
      description     { Faker::Loren.Sentence(1) }
      starts_at       { Faker::Time.between(4.days.ago, Date.today, :all)}
      ends_at         { Faker::Time.between(1.day.ago, Date.today, :all)}
      includes_food   false
      includes_drinks true
      active          true
  end
end
