FactoryBot.define do
  factory :item do
    name                   { '商品名' }  
    description            { '商品の説明' } 
    category               { CategoryId.find_or_create_by(name: 'メンズ') } 
    condition              { ConditionId.find_or_create_by(name: '新品、未使用') }
    shipping_charge        { ShippingChargeId.find_or_create_by(name: '着払い(購入者負担)') }
    prefecture             { PrefectureId.find_or_create_by(name: '北海道') }
    shipping_day           { ShippingDayId.find_or_create_by(name: '1\~2日で発送') }
    price                  { 1000 }
  end
end

