class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :room_no
      t.string :location
      t.string :level
      t.text :description

      t.timestamps
    end
  end
end
