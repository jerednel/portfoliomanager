class ContactsHotelsJoin < ActiveRecord::Migration
  def up
  	create_table 'contacts_hotels', :id => false do |t|
  		t.column 'contact_id', :integer
  		t.column 'hotel_id', :integer
  	end
  end

  def down
  	drop_table 'contacts_hotels'
  end
end
