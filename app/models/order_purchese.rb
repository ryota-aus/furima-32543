class OrderPurchese
  include ActiveModel::Model
  attr_accessor :token, :address, :prefecture_id, :city, :house_number, :phone_number, :build, :user_id, :item_id
  with_options presence: true do
     validates :city, :house_number
     # 「住所」の郵便番号に関するバリデーション
     validates :address, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
  
     # 「電話番号」に関するバリデーション
     validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'Input only number' }
     # クレジットカード
     validates :token
     validates :user_id, :item_id
    end
     # 都道府県に関するバリデーション
     validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
     def save
      # 購入情報を保存
      purchese = Purchese.create(item_id: item_id, user_id: user_id)
      # 住所情報を保存
      Order.create( address: address, prefecture_id: prefecture_id, city: city, house_number: house_number, phone_number: phone_number, build: build, purchese_id: purchese.id)
      
      
    end
    
end