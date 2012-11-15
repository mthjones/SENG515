class ChangeSessionsDescriptionToText < ActiveRecord::Migration
  def change
    change_column :sessions, :description, :text
  end
end
