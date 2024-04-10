FactoryBot.define do
  factory :order_form do
    association :user
    association :item
    
    postal_code    { '123-1234' } 
    prefecture_id  { Faker::Number.within(range: 1..47) }
    city           { Faker::Address.city }
    address        { Faker::Address.street_address }
    building       { Faker::Address.secondary_address }
    phone_number   { "09012345678" }
  end
end