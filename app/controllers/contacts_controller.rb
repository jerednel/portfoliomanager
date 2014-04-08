class ContactsController < ApplicationController
  before_filter :logged_in? 
	def new
		@contact = Contact.new
		@hotel = Hotel.find(params[:hotel_id])
	end

	def create
		@hotel = Hotel.find(params["contact"]["id"])
		@contact = Contact.new("first_name" => params[:contact][:first_name], "last_name" => params[:contact][:last_name], "phone" => params[:contact][:phone], "email" => params[:contact][:email], "email" => params[:contact][:title])
		@hotel.contacts << @contact
		if @contact.save
			redirect_to hotels_path + "/#{@hotel.id}", :notice => "Contact added"
		else
			render "new"
		end
	end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])

    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        format.html { redirect_to @contact.hotels.first, notice: 'Contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end
end
