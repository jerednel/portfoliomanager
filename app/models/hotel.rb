class Hotel < ActiveRecord::Base
	attr_accessible :inncode, :name
	validates_uniqueness_of :inncode
	validates_presence_of :inncode, :name
	has_and_belongs_to_many :users
	has_and_belongs_to_many :tasks
	has_and_belongs_to_many :contacts
end
