class CreateListenedAlbums < ActiveRecord::Migration
  def change
    create_table :listened_albums do |t|
      t.integer :user_id
      t.integer :album_id
      t.date    :date_listened

      t.timestamps null: false
    end
  end
end
