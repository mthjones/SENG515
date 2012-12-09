class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :title
      t.text :description
      t.datetime :start_datetime
      t.datetime :end_datetime

      t.timestamps
    end
  end
end
