FactoryBot.define do
  factory :user do
    email                 { 'test@example.com' } # 有効なメールアドレスの形式に修正
    password              { 'Password1' } # 半角英字と半角数字の組み合わせ
    password_confirmation { 'Password1' } # パスワードと同じ値を設定
    name                  { 'Test User' }
    first_name_kanji      { '漢字名' }
    family_name_kanji     { '漢字姓' }
    first_name_kana       { 'カナメイ' }
    family_name_kana      { 'カナセイ' }
    birth_days            { Date.today }
  end
end