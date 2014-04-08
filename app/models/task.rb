class Task < ActiveRecord::Base
	attr_accessible :name
	has_and_belongs_to_many :hotels
	validates_presence_of :name
end
