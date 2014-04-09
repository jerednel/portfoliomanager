class Hotel < ActiveRecord::Base
	attr_accessible :phone, :inncode, :name, :address, :city, :state, :global_web_url, :local_web_url, :facebook_url, :twitter_url
	validates_uniqueness_of :inncode
	validates_presence_of :inncode, :name
	has_and_belongs_to_many :users
	has_and_belongs_to_many :tasks
	has_and_belongs_to_many :contacts
	has_many :notes
	accepts_nested_attributes_for :notes
end
