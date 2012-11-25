class ChangeRoomsRoomNoToInteger < ActiveRecord::Migration
  def change
    change_column :rooms, :room_no, :integer
  end
end
