class DropUsersTable < ActiveRecord::Migration
  def up
    drop_table :users
  end

  def down
    create_table :users do |t|
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.string :user_type

      t.timestamps
    end
  end
end
