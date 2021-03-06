FactoryGirl.define do
  factory :user do
    email
    password 'secret123'
    sequence(:username) { |n| "wędkarz #{n}" }
  end

  sequence :email do |n|
    "#{('a'..'z').to_a.sample(10).join}@example.com"
  end
end
