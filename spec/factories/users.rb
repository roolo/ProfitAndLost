FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "joe#{n}@example.com" }
    password         'joesthebest'

    trait :with_ba_credentials do
      billapp_subdomain 'rooland'

      billapp_username  'joe@example.com'
      billapp_userpass  'joesthebest'
    end
  end
end
