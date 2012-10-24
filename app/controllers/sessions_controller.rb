class SessionsController < ApplicationController
  def show
    
  end
  
  def new
    @workshop = Workshop.find(params[:workshop_id])
    @session = @workshop.sessions.build
  end
  
  def create
    @workshop = Workshop.find(params[:workshop_id])
    @session = @workshop.sessions.build(params[:session])
    if @session.save
      flash[:success] = "Session successfully created!"
      redirect_to @workshop
    else
      render 'new'
    end
  end
  
  def edit
    @session = Session.find(params[:id])
    @workshop = @session.workshop
  end
  
  def update
    @workshop = Workshop.find(params[:workshop_id])
    @session = Session.find(params[:id])
    if @session.update_attributes(params[:session])
      flash[:success] = "Session successfully updated!"
      redirect_to @workshop
    else
      render 'edit'
    end
  end
  
  def destroy
    @workshop = Workshop.find(params[:workshop_id])
    Session.find(params[:id]).destroy
    flash[:success] = "Session successfully deleted!"
    redirect_to @workshop
  end
end
