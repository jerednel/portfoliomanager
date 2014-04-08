class TasksController < ApplicationController

	def new
		@task = Task.new
		@hotel = Hotel.find(params[:hotel_id])
	end

	def create
		@hotel = Hotel.find(params["task"]["id"])
		@task = Task.new("name" => params[:task][:name])
		@hotel.tasks << @task
		if @task.save
			redirect_to hotels_path + "/#{@hotel.id}", :notice => "Task added"
		else
			render "new"
		end
	end

	def close
		@task = Task.find(params["task_id"])
		@task.status = 'closed'
		@task.save
		redirect_to request.referrer
	end

	def reopen
		@task = Task.find(params["task_id"])
		@task.status = 'open'
		@task.save
		redirect_to request.referrer
	end

  def destroy
    @task = Task.find(params["task_id"])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to request.referrer }
      format.json { head :no_content }
    end
  end
end