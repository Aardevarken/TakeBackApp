class PagesController < ApplicationController::Base

	def search

	end

	def result
		@project = Project.where("location LIKE ?", "#{params[:search]}%")
   		render :action => :index
	end
end
