class AddWorkshopIdToSession < ActiveRecord::Migration
  def change
    change_table :sessions do |t|
      t.references :workshop
    end
  end
end
