class CreateUsersSessionsTable < ActiveRecord::Migration
  def up
  	  create_table :users_sessions, id: false do |t|
      t.references :user
      t.references :session
    end
    add_index :users_sessions, [:user_id, :session_id]
    add_index :users_sessions, [:session_id, :user_id]
  end

  def down
  	 drop_table :users_sessions
  end
end

