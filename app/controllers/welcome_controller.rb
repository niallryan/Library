class WelcomeController < ApplicationController
	def index
    @users = User.search(params[:search_query])
	end
end
