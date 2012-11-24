class CreateUserSessions < ActiveRecord::Migration
  def change
    create_table :user_sessions do |t|
      t.integer :session_id
      t.integer :user_id

      t.timestamps
    end
  end
end
