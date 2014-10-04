class AddGroupToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :group, :string
  end
end
