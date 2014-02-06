require 'securerandom'

FactoryGirl.define do
  
  factory :link do
    short_url   SecureRandom.urlsafe_base64(6)
    sequence(:long_url) { |i| "https://github.com/jraczynski/shortly#{i}" }
  end

  factory :user do
    name     "Cthulhu"
    email    "cthulhu@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end