class CreateRoomSessionsAssociation < ActiveRecord::Migration
  def up
    change_table :sessions do |t|
      t.references :room
    end
  end

  def down
    remove_column :sessions, :room_id
  end
end
