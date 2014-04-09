class CreateHotelNotesTable < ActiveRecord::Migration
  def up
  	create_table :notes do |t|
  		t.text :note_detail
  		t.integer :hotel_id
  		t.string :string
  	end
  end

  def down
  end
end
