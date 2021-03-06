class WorkshopsController < ApplicationController
	before_filter :authenticate_admin!, except: [:index, :show]
	
	def index
		if params.has_key?(:all)
			@workshops = Workshop.order("start_date ASC")
		else
      @workshops = Workshop.where("end_date >= ?", Date.today).order("start_date ASC")
		end
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

	def edit
    @workshop = Workshop.find(params[:id])
	end

	def update
		@workshop = Workshop.find(params[:id])
		if @workshop.update_attributes(params[:workshop])
			flash[:success] = "Workshop successfully updated!"
			redirect_to @workshop
		else
			render 'edit'
		end
	end

	def destroy
		Workshop.find(params[:id]).destroy
		flash[:success] = "Workshop successfully deleted!"
		redirect_to workshops_url
	end
end
