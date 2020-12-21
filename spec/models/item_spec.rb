require 'rails_helper'

describe Item do
  before do
    @item = FactoryBot.build(:item)
  end
 describe '商品出品機能登録' do
  context '内容に問題ない場合' do
    
   it "必須項目が全てあれば登録できること" do
    
    expect(@item).to be_valid
   end
   it "priceが300ちょうどだと登録できる" do
    @item.price = 300
    @item.valid?
    expect(@item).to be_valid
  end
  #14
  it "priceが9999999だと登録できる" do
    @item.price = 9999999
    @item.valid?

    expect(@item).to be_valid
  end
  end

  context '内容に問題ある場合' do
    it "imageがない場合は登録できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include ("Image can't be blank")
    end

   
   it "nameがない場合は登録できないこと" do
    @item.name = ""
    @item.valid?
    expect(@item.errors.full_messages).to include ("Name can't be blank")
   end
   #2
   it "descriptionがない場合は登録できないこと" do
    @item.description = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Description can't be blank")
  end  
  #3
  it "category_idがない場合は登録できないこと" do
    @item.category_id = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Category is not a number")
  end
  it "condition_idがない場合は登録できないこと" do
    @item.condition_id = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Condition is not a number")
  end
  #4
  it "shipping_charge_idがない場合は登録できないこと" do
    @item.shipping_charge_id = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping charge is not a number")
  end
  #5
  it "prefecture_idがない場合は登録できないこと" do
    @item.prefecture_id = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture is not a number")
  end
  #6
  it "delivery_day_idがない場合は登録できないこと" do
    @item.delivery_day_id = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Delivery day is not a number")
  end
  it "category_idが1（--）場合は登録できないこと" do
    @item.category_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Category must be other than 1")
  end
  #4
  it "shipping_charge_idが1（--）場合は登録できないこと" do
    @item.shipping_charge_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping charge must be other than 1")
  end
  #5
  it "prefecture_idがが1（--）場合は登録できないこと" do
    @item.prefecture_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
  end
  #6
  it "delivery_day_idが1（--）場合は登録できないこと" do
    @item.delivery_day_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Delivery day must be other than 1")
  end
  #7
  it "priceがない場合は登録できないこと" do
    @item.price = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank", "Price is out of setting range")
  end
 
 
  
  it "priceが299以下だと登録できないこと" do
    @item.price = 299
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is out of setting range")
  end
  
  
   #15
   it "priceが10000000だと登録できないこと" do
    @item.price = 10000000
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is out of setting range")
   end
   it "販売価格は半角数字以外登録できないこと" do
    @item.price = "５００"
    @item.valid?
    expect(@item.errors.full_messages).to include("Price Item doesn't match price")
   end
   it "販売価格は半角英語だけでは登録できないこと" do
    @item.price = "eee"
    @item.valid?
    expect(@item.errors.full_messages).to include("Price Item doesn't match price")
   end
   it "販売価格は半角英数字混合では登録できないこと" do
    @item.price = "５００eee"
    @item.valid?
    expect(@item.errors.full_messages).to include("Price Item doesn't match price")
   end
  end
 end
end


