class CreateShopItems < ActiveRecord::Migration
  def change
    create_table :shop_items do |t|
      t.string :external_url
      t.string :title
      t.string :description
      t.decimal :price, precision: 7, scale: 2
      t.string :etsy_id
      t.string :image_url
      t.timestamps null: false
    end

    add_index :shop_items, :etsy_id
    add_index :shop_items, :title
    add_index :shop_items, :price
  end
end
