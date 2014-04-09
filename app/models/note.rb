class Note < ActiveRecord::Base
	attr_accessible :note_detail, :string, :hotel_id
	belongs_to :hotel
end
