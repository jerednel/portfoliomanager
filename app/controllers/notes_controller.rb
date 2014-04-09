class NotesController < ApplicationController
before_filter :logged_in? 
	def new
		@user = User.find(session[:user_id])
		if Hotel.where("id = ?", params[:hotel_id]).count  == 1 && @user.hotels.where("id = ?", params[:hotel_id]) != '[]' #make sure hotel exists and hotel belongs to the user
			@note = Note.new
			@hotel = Hotel.find(params[:hotel_id])
		else
			redirect_to :controller => "hotels", :action => "index"
		end
	end

	def create
		@hotel = Hotel.find(params["note"]["hotel_id"])
		@note = Note.new("note_detail" => params[:note][:note_detail], "hotel_id" => params[:note][:hotel_id])
		#@hotel.notes << @note
		respond_to do |format|
		  if @note.save
			  format.html { redirect_to @hotel }
			  format.js
		  else
			  render "new"
		  end
		 end
	end
  def destroy
    @note = Note.find(params["id"])
    @note.destroy

    respond_to do |format|
      format.html { redirect_to request.referrer }
      format.json { head :no_content }
    end
  end
end
