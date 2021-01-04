FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.jpg'), filename: 'apple-touch-icon.jpg')
    end
    name               {"test"}
    description        {"aaa"}
    category_id           {2}
    condition_id          {2}
    shipping_charge_id    {2}
    prefecture_id         {2}
    delivery_day_id       {2}
    price                {400}
    association :user 
  end
end