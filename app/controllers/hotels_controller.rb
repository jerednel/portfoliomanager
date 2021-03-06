class HotelsController < ApplicationController
	before_filter :logged_in? 
	def new
		@hotel = Hotel.new
	end
	def edit
    	@hotel = Hotel.find(params[:id])
	end
	def update
    	@hotel = Hotel.find(params[:id])

    	respond_to do |format|
     	if @hotel.update_attributes(params[:hotel])
       	 	format.html { redirect_to @hotel, notice: 'Hotel was successfully updated.' }
       	 	format.json { head :no_content }
    	 else
      	  	format.html { render action: "edit" }
       	 	format.json { render json: @hotel.errors, status: :unprocessable_entity }
    	 end
    end

	end
	def show

		@user = User.find(session[:user_id])
		if Hotel.where("id = ?", params[:id]).count  == 1 && @user.hotels.where("id = ?", params[:id]) != '[]'
			@hotel = Hotel.find(params[:id])
			@tasks = @hotel.tasks.where("status = 'open'")
			@notes = @hotel.notes
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
		@hotels = @user.hotels.order("inncode")
		#@tasks = @hotels.tasks
	end

	def transfer
		@user = User.find(session[:user_id])
	  if Hotel.where("id = ?", params[:id]).count  == 1 && @user.hotels.where("id = ?", params[:id]) != '[]'
		@hotel = Hotel.find(params[:id])
	  else
	  	redirect_to :controller => "hotels", :action => "index"

	  end
	end

	def do_transfer

		@old_user_id = User.find(params[:hotel][:old_user_id])
		@hotel = Hotel.find(params[:hotel][:id])
		@new_user = User.find(params[:hotel][:user_ids])
		@hotel.users.delete(@old_user_id)
		@hotel.users << @new_user
		redirect_to hotels_path, :notice => "Hotel Transferred"


	end

end


