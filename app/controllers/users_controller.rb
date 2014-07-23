class UsersController < ApplicationController

	def sidebar
		@user = current_user
	end


end
