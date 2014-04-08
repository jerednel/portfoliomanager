class ContactsController < ApplicationController
	def new
		@contact = Contact.new
		@hotel = Hotel.find(params[:hotel_id])
	end

	def create
		@hotel = Hotel.find(params["contact"]["id"])
		@contact = Contact.new("first_name" => params[:contact][:first_name], "last_name" => params[:contact][:last_name], "phone" => params[:contact][:phone], "email" => params[:contact][:email])
		@hotel.contacts << @contact
		if @contact.save
			redirect_to hotels_path + "/#{@hotel.id}", :notice => "Contact added"
		else
			render "new"
		end
	end
end
