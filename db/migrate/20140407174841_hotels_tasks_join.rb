class HotelsTasksJoin < ActiveRecord::Migration
  def up
  	create_table 'hotels_tasks', :id => false do |t|
  		t.column 'hotel_id', :integer
  		t.column 'task_id', :integer
  	end
  end

  def down
  	drop_table 'hotels_tasks'
  end
end
