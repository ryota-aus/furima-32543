class PurchesesController < ApplicationController
  before_action :set_item, only:[:index, :create]
  before_action :sold_out_item
  before_action :authenticate_user!
  before_action :user_myself
 
  def index
  
    @order_purchese = OrderPurchese.new   #「OrderPurchese」に編集
   
  end
 
  def create
    @order_purchese = OrderPurchese.new(purchese_params)   #「OrderPurchese」に編集
     if @order_purchese.valid?
       pay_item
       @order_purchese.save
       redirect_to root_path
     else
       render :index
     end
    
  end
 
  private
   # 全てのストロングパラメーターを1つに統合
  def purchese_params
   params.require(:order_purchese).permit(:address, :prefecture_id, :city, :house_number, :phone_number, :build).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end
  def set_item
    @item = Item.find(params[:item_id])
  end
  def  pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: purchese_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    end
    def sold_out_item
      if @item.purchese.present?
      redirect_to root_path 
     end
    end
    def user_myself
      if @item.user.id == current_user.id 
         redirect_to root_path
      end
    end
end

