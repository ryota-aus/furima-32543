FactoryBot.define do
  factory :order_purchese do
    token {'bararara'}
    address { '123-4567' }
    prefecture_id { 2 }
    city { '大阪' }
    house_number { '1-1' }
    build {'a'}
    phone_number { 12121212121 }
    # user_id {1}
    # item_id {1}
  end
end
