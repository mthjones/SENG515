class CreateUsersSessionsTable < ActiveRecord::Migration
  def up
  	  create_table :sessions_users, id: false do |t|
      t.references :user
      t.references :session
    end
    add_index :sessions_users, [:user_id, :session_id]
    add_index :sessions_users, [:session_id, :user_id]
  end

  def down
  	 drop_table :sessions_users
  end
end

