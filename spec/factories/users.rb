FactoryBot.define do
  factory :user do
    name { 'Test User' } # Remove one of the name definitions
    email { Faker::Internet.unique.email }
    password              { 'Password1' } 
    password_confirmation { 'Password1' } 
    first_name_kanji      { '漢字名' }
    family_name_kanji     { '漢字姓' }
    first_name_kana       { 'カナメイ' }
    family_name_kana      { 'カナセイ' }
    birth_days            { Date.today }
  end
end