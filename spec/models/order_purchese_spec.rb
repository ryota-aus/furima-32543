require 'rails_helper'

RSpec.describe OrderPurchese, type: :model do
  before do
    seller = FactoryBot.create(:user)
    buyer = FactoryBot.create(:user)
    item = FactoryBot.build(:item, user_id: seller.id)
    item.save
    @order_purchese = FactoryBot.build(:order_purchese, user_id: buyer.id, item_id: item.id)
    sleep(1)
  end

  describe '商品購入機能' do
   context '内容に問題ない場合' do

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_purchese).to be_valid
    end
    it 'buildは空でも保存できること' do
      @order_purchese.build = nil
      expect(@order_purchese).to be_valid
    end
   end
    context '内容に問題ある場合' do
    it 'addressが空だと保存できないこと' do
      @order_purchese.address = nil
      @order_purchese.valid?
      expect(@order_purchese.errors.full_messages).to include("Address can't be blank")
    end
   
    it 'addressが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_purchese.address = '1234567'
      @order_purchese.valid?
      expect(@order_purchese.errors.full_messages).to include("Address is invalid. Include hyphen(-)")
    end
    it 'prefectureを選択していないと保存できないこと' do
      @order_purchese.prefecture_id = 1
      @order_purchese.valid?
      expect(@order_purchese.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空だと保存できないこと' do
      @order_purchese.city = nil
      @order_purchese.valid?
      expect(@order_purchese.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberは空だと保存できないこと' do
      @order_purchese.house_number = nil
      @order_purchese.valid?
      expect(@order_purchese.errors.full_messages).to include("House number can't be blank")
    end
    it 'phone_numberは空だと保存できないこと' do
      @order_purchese.phone_number = nil
      @order_purchese.valid?
      expect(@order_purchese.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberは11桁以内でないと保存できないこと' do
      @order_purchese.phone_number = 123456789000
      @order_purchese.valid?
      expect(@order_purchese.errors.full_messages).to include("Phone number Input only number")
      end
    it 'phone_numberが半角数字以外だと保存できないこと' do
      @order_purchese.phone_number = 'あa２０００００００'
      @order_purchese.valid?
      expect(@order_purchese.errors.full_messages).to include("Phone number Input only number")
    end
    it "tokenが空では登録できないこと" do
      @order_purchese.token = nil
      @order_purchese.valid?
      expect(@order_purchese.errors.full_messages).to include("Token can't be blank")
    end
    it "user_idが空では登録できないこと" do
      @order_purchese.user_id = nil
      @order_purchese.valid?
      expect(@order_purchese.errors.full_messages).to include("User can't be blank")
    end
    it "item_idが空では登録できないこと" do
      @order_purchese.item_id = nil
      @order_purchese.valid?
      expect(@order_purchese.errors.full_messages).to include("Item can't be blank")
    end
   
   end
  end
end