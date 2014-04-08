class HotelsUsersJoin < ActiveRecord::Migration
  def up
  	create_table 'hotels_users', :id => false do |t|
  		t.column 'hotel_id', :integer
  		t.column 'user_id', :integer
  	end
  end

  def down
  	drop_table 'hotels_users'
  end
end
