class SessionsController < ApplicationController
  respond_to :html, :js
  
  def show
    @session = Session.find(params[:id])
    respond_with @session
  end
  
  def new
    @workshop = Workshop.find(params[:workshop_id])
    @session = @workshop.sessions.build
    respond_with @session
  end
  
  def create
    @workshop = Workshop.find(params[:workshop_id])
    @session = @workshop.sessions.build(params[:session])
    flash[:notice] = "Session created successfully" if @session.save
    respond_with @session, location: workshop_path(@workshop)
  end
  
  def edit
    @session = Session.find(params[:id])
    @workshop = @session.workshop
    respond_with @session
  end
  
  def update
    @workshop = Workshop.find(params[:workshop_id])
    @session = Session.find(params[:id])
    flash[:notice] = "Session updated successfully" if @session.update_attributes(params[:session])
    respond_with @session, location: workshop_path(@workshop)
  end
  
  def destroy
    @workshop = Workshop.find(params[:workshop_id])
    @session = Session.find(params[:id])
    @session.destroy
    respond_with @session, location: workshop_path(@workshop)
  end
  
  def register
    @session = Session.find(params[:id])
    current_user.sessions << @session
    redirect_to Workshop.find(params[:workshop_id])
  end
end
