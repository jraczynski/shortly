require 'securerandom'

FactoryGirl.define do
  
  factory :link do
    sequence(:short_url) { SecureRandom.urlsafe_base64(6) }
    sequence(:long_url) { |i| "https://github.com/jraczynski/shortly#{i}" }

    factory :link_with_user do
      user
    end
  end

  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end
end