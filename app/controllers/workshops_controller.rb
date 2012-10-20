class WorkshopsController < ApplicationController
	def index
      @workshops = Workshop.all.reverse
	end

	def show
      @workshop = Workshop.find(params[:id])
	end

	def new
	  if current_user
		  @workshop = Workshop.new
		else
		  redirect_to new_session_path
		end
	end

	def create
		if current_user
			@workshop = Workshop.new(params[:workshop])
			if @workshop.save
				flash[:success] = "Workshop successfully created!"
				redirect_to @workshop
			else
				render 'new'
			end
		else
			redirect_to status: 404
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
		if current_user
			@workshop = Workshop.find(params[:id])
			if @workshop.update_attributes(params[:workshop])
				flash[:success] = "Workshop successfully updated!"
				redirect_to @workshop
			else
				render 'edit'
			end
		else
			redirect_to status: 404
		end
	end

	def destroy
		if current_user
			Workshop.find(params[:id]).destroy
			flash[:success] = "Workshop successfully deleted!"
			redirect_to workshops_url
		else
			redirect_to new_session_path
		end
	end
end
