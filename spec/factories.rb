require 'securerandom'

FactoryGirl.define do
  
  factory :link do
    short_url   SecureRandom.urlsafe_base64(6)
    sequence(:long_url) { |i| "https://github.com/jraczynski/shortly#{i}" }
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