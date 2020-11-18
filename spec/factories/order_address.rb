FactoryBot.define do
  factory :order_address do
    token { "tok_abcdefghijk00000000000000000" }
    postal_code { '1234567' }
    prefecture_id { 1 }
    municipality {'aaa'}
    house_number {'1-1'}
    building_name { '' }
    phone_number { '09012345678' }
    item_id { 1 }
    user_id { 1 }
  end
end