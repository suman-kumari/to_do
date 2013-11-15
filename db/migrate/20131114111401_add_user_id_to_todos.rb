class AddUserIdToTodos < ActiveRecord::Migration
  def self.up
    add_column :todos, :user_id, :integer
    add_column :todos, :privacy, :boolean
  end
  def self.down
    remove_column :todos, :user_id, :integer
    remove_column :todos, :privacy, :boolean
  end
end
