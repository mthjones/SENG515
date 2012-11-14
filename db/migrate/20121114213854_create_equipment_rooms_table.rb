class CreateEquipmentRoomsTable < ActiveRecord::Migration
  def up
    create_table :equipment_rooms, id: false do |t|
      t.references :room
      t.references :equipment
    end
    add_index :equipment_rooms, [:room_id, :equipment_id]
    add_index :equipment_rooms, [:equipment_id, :room_id]
  end

  def down
    drop_table :equipment_rooms
  end
end
