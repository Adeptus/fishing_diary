FactoryGirl.define do
  factory :fish do
    sequence(:name) { |n| "fish_#{n}" }
    description "MyText"
  end
end
