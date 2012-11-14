class CreateRoomsEquipmentTable < ActiveRecord::Migration
  def up
    create_table :rooms_equipment, id: false do |t|
      t.references :room
      t.references :equipment
    end
    add_index :rooms_equipment, [:room_id, :equipment_id]
    add_index :rooms_equipment, [:equipment_id, :room_id]
  end

  def down
    drop_table :rooms_equipment
  end
end
