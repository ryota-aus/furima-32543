class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_item, only: [:edit, :show]
  def index
    @items = Item.all.order("created_at DESC")
 
  end
  def new
   @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  #def edit
    
  #end
  def show
    
  end


  private

  def item_params
    params.require(:item).permit(:image,:name,:description,:price,:category_id,:condition_id,:shipping_charge_id,:prefecture_id,:delivery_day_id,:numericality).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end
  

end
