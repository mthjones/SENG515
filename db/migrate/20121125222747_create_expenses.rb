class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.references :budget
      t.string :name
      t.decimal :amount

      t.timestamps
    end
    add_index :expenses, :budget_id
  end
end
