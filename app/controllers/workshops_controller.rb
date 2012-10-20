class WorkshopsController < ApplicationController
	def index
	  if current_user
      @workshops = Workshop.all.reverse
    else
      redirect_to new_session_path
    end	
	end

	def show
	  if current_user
      @workshop = Workshop.find(params[:id])
    else
      redirect_to new_session_path
    end 
	end

	def new
	  if current_user
		  @workshop = Workshop.new
		else
		  redirect_to new_session_path
		end
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
	  if current_user
      @workshop = Workshop.find(params[:id])
    else
      redirect_to new_session_path
    end 
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
