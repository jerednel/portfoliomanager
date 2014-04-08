class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			session[:user_id] = @user.id
			redirect_to hotels_path, :notice => "Signed up! You are now logged in.  Add some hotels!"
		else
			render "new"
		end
	end
end
