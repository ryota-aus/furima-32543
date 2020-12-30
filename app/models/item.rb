class Item < ApplicationRecord
  belongs_to :user
  has_one :purchese
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge   #ActiveHash
  belongs_to :prefecture
  belongs_to :delivery_day
    
  #空の投稿を保存できないようにする
  with_options presence: true do       #ActiveHash
  validates :name, :description, :price, :image
  end
  validates :price, numericality: {with: /\A[0-9]+\z/, message:"Item doesn't match price"} 
    
  #ジャンルの選択が「--」の時は保存できないようにする   
  with_options numericality:{ other_than: 1 } do    #ActiveHash
  validates :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :delivery_day_id 
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
end