FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {Faker::Internet.free_email}
    password              {"a23456"}
    password_confirmation {password}
    first_name            {"田中"}
    last_name             {"太朗"}
    first_name_kana       {"タナカ"}
    last_name_kana        {"タロウ"}
    birth_day             {"2000-01-01"}
  end
end