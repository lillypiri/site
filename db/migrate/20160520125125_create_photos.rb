class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :image_url
      t.text :caption
      t.string :tags
      t.datetime :posted_at
      t.string :instagram_id
      t.string :external_url

      t.timestamps null: false
    end
    
    add_index :photos, :instagram_id
    add_index :photos, :tags
    add_index :photos, :posted_at
  end
end
