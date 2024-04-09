FactoryBot.define do
  factory :order_form do
    
    postal_code    { "123-4567" } 
    prefecture_id  { Faker::Number.within(range: 1..47) }
    city           { Faker::Address.city }
    address        { Faker::Address.street_address }
    building       { Faker::Address.secondary_address }
    phone_number   { Faker::PhoneNumber.phone_number }

  end
end
