class HotelsController < ApplicationController
	before_filter :logged_in? 
	def new
		@hotel = Hotel.new
	end

	def show

		@user = User.find(session[:user_id])
		if Hotel.where("id = ?", params[:id]).count  == 1 && @user.hotels.where("id = ?", params[:id]) != '[]'
			@hotel = Hotel.find(params[:id])
			@tasks = @hotel.tasks.where("status = 'open'")
			@closed_tasks = @hotel.tasks.where("status = 'closed'")
			@contacts = @hotel.contacts
			@contact_email_list = []
			@contacts.each do |contact|
				@contact_email_list << contact.email	
			end
			@contact_email_list = @contact_email_list.join(';')
		else
			redirect_to :controller => "hotels", :action => "index"
		end
	end

	def create
		@user = User.find(session[:user_id])
		@hotel = Hotel.new(params[:hotel])
		@user.hotels << @hotel
		if @hotel.save
			redirect_to hotels_path, :notice => "Hotel added"
		else
			render "new"
		end
	end

	def index
		@user = User.find(session[:user_id])
		@hotels = @user.hotels
	end

end


