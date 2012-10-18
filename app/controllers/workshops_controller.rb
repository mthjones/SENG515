class WorkshopsController < ApplicationController
	def index
		@workshops = Workshop.all.reverse
	end

	def show
		@workshop = Workshop.find(params[:id])
	end

	def new
		@workshop = Workshop.new
	end

	def create
		@workshop = Workshop.new(params[:workshop])
		if @workshop.save
			flash[:success] = "Workshop successfully created!"
			redirect_to @workshop
		else
			render 'new'
		end
	end
end
