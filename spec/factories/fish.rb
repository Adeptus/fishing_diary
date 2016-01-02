FactoryGirl.define do
  factory :fish do
    sequence(:name) { |n| "fish#{n}" }
    description "MyText"
  end
end
