FactoryBot.define do
  factory :item do
    name                   { '商品名' }  
    description            { '商品の説明' } 
    category_id            { 2 } 
    condition_id           { 2 }
    shipping_charge_id     { 2 }
    prefecture_id          { 2 }
    shipping_day_id        { 2 }
    price                  { 1000 }
    association :user # userとの関連付け
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end