class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.references :workshop
      t.decimal :accomodation_cost, :precision => 10, :scale => 2
      t.decimal :venue_cost, :precision => 10, :scale => 2

      t.timestamps
    end
    add_index :budgets, :workshop_id
  end
end
