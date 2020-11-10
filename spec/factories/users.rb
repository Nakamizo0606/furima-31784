FactoryBot.define do
  factory :user do
    nickname {"test"}
    email {Faker::Internet.free_email}
    password {"a000000"}
    password_confirmation {"a000000"}
    last_name {"山田"}
    first_name {"太郎"}
    last_name_kana {"ヤマダ"}
    first_name_kana {"タロウ"}
    birthday {'1991-06-06'}
  end
end
