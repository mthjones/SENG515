class AddAdminOnlyToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :admin_only, :boolean
  end
end
