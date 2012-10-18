class WorkshopsController < ApplicationController
	def index
		@workshops = Workshop.all
	end

	def show
		@workshop = Workshop.find(params[:id])
	end

	def new
		@workshop = Workshop.new
	end
end
