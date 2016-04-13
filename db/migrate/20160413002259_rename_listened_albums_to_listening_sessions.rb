class RenameListenedAlbumsToListeningSessions < ActiveRecord::Migration
  def change
    rename_table :listened_albums, :listening_sessions
  end
end
