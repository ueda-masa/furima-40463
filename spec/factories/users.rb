FactoryBot.define do
  factory :user do
    sequence(:nickname) { |n| "test#{n}" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
    first_name_kanji { '山田' }
    family_name_kanji { '太郎' }
    first_name_kana { 'ヤマダ' }
    family_name_kana { 'タロウ' }
    birth_days { Date.new(1990, 1, 1) }
  end
end