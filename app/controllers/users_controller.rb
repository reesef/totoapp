class UsersController < ApplicationController
	
	respond_to :html, :xml, :js

	def show
		@user = User.find(params[:id])
	end

end