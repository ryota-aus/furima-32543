class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string     :address,               null: false
      t.integer    :prefecture_id,         null: false
      t.string     :city,                  null: false
      t.string     :house_number,          null: false
      t.string     :build
      t.string     :phone_number,          null: false
      t.references :purchese,                null: false, foreign_key: true 
      t.timestamps
    end
  end
end
