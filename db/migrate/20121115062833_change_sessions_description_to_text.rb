class ChangeSessionsDescriptionToText < ActiveRecord::Migration
  def change
    change_column :sessions, :description, :text, limit: nil
  end
end
