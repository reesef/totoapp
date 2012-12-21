class TasksController < ApplicationController

	attr_accessor :completed
	before_filter :authenticate_user!
	before_filter :find_list
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

	def edit
		@list = List.find(params[:list_id])
		@task = Task.find(params[:id])
	end

	def update
		@list = List.find(params[:list_id])
		@task = Task.find(params[:id])
		if @task.update_attributes(params[:task])
		flash[:notice] = "Task updated."
		respond_with(@list, :location => list_path(@list))
		else flash[:error] = "Could not update list."
		redirect_to edit_list_task_path
		end
	end

	def complete
		@list = List.find(params[:list_id])
		@task = @list.tasks.find(params[:id])
		@task.completed = true
		@task.save
		redirect_to list_path(@list)
	end

	private

	def find_list
		@list = List.find(params[:list_id])
	end

end
