class AddAttributesToHotels < ActiveRecord::Migration
  def change
  	add_column :hotels, :address, :string
  	add_column :hotels, :city, :string
  	add_column :hotels, :state, :string
  	add_column :hotels, :global_web_url, :string
  	add_column :hotels, :local_web_url, :string
  	add_column :hotels, :facebook_url, :string
  	add_column :hotels, :twitter_url, :string
  end
end
