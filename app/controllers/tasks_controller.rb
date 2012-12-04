class TasksController < ApplicationController

	respond_to :html, :xml, :js

	def create
		@list = List.find(params[:list_id])
		@task = @list.tasks.new(params[:task])
		@task.user_id = current_user.id
		if @task.save
			flash[:notice] = "Task Created."
			redirect_to list_path(@list)
		else
			flash[:error] = "Could not create task."
			redirect_to list_path(@list)
		end
	end


end
