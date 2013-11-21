FactoryGirl.define do
 factory :todo do
    title { Faker::Name.title }
    description { Faker::Lorem.paragraph }
    completed true
    privacy false
    start_date_time Date.today
    end_date_time Date.tomorrow
    user
  end

  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password "secret"
    password_confirmation "secret"
  end
end
