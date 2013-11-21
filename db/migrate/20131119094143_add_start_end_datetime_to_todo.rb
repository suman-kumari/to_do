class AddStartEndDatetimeToTodo < ActiveRecord::Migration
  def change
    add_column :todos, :start_date_time, :date
    add_column :todos, :end_date_time, :date
  end
end
