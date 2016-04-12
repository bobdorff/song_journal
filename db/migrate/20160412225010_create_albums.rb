class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string  :title
      t.string  :artist
      t.string  :amazon_link
      t.integer :seconds
      t.integer :format_id

      t.timestamps null: false
    end
  end
end
