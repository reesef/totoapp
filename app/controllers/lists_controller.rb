class ListsController < ApplicationController

	respond_to :html, :xml, :js

	def index
		respond_with(@lists = List.all)
	end

	def new
		@list = List.new
	end

	def create
		@list = List.new(params[:list])
		if @list.save
			flash[:notice] = "List Created."
			respond_with(@list, :location => list_path(@list))
		else
			flash[:error] = "Could not create list."
			redirect_to new_list_path
		end
	end

	def show
		@list = List.find(params[:id])
	end

	def edit
		@list = List.find(params[:id])
	end

	def update
		@list = List.find(params[:id])
		if @list.update_attributes(params[:list])
		flash[:notice] = "List updated."
		respond_with(@list, :location => list_path(@list))
		else flash[:error] = "Could not update list."
		redirect_to edit_list_path
		end
	end

	def destroy
		@list = List.find(params[:id])
		if @list.destroy
			flash[:notice] = "List deleted."
			redirect_to lists_path
		else flash[:error] = "Could not delete list."
			redirect_to lists_path
		end
	end


end
