FactoryGirl.define do
  factory :event do
      name            { Faker::Name.name }
      description     { Faker::Lorem.sentence(1) }
      starts_at       { Faker::Time.between(10.days.ago, 5.days.ago, :all)}
      ends_at         { Faker::Time.between(3.day.ago, 1.days.ago, :all)}
      includes_food   false
      includes_drinks true
      active          true
      user            { build :user }
  end
end
