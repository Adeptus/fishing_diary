FactoryGirl.define do
  factory :catch_method do
    sequence(:name) { |n| "method_#{n}" }
    fishing_type 'float'
  end
end
