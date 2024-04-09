FactoryBot.define do
  factory :order_form do


    postal_code    { Faker::Address.zip_code }
    prefecture_id  { Faker::Number.within(range: 1..47) }
    city           { Faker::Address.city }
    address        { Faker::Address.street_address }
    building       { Faker::Address.secondary_address }
    phone_number   { Faker::PhoneNumber.phone_number }

    after(:build) do |order|
      order.item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
