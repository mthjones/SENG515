class SessionsController < ApplicationController
  def show
    @session = Session.find(params[:id])
    
    respond_to do |format|
      format.js
    end
  end
  
  def new
    @workshop = Workshop.find(params[:workshop_id])
    @session = @workshop.sessions.build
    
    respond_to do |format|
      format.js
    end
  end
  
  def create
    @workshop = Workshop.find(params[:workshop_id])
    @session = @workshop.sessions.build(params[:session])
    if @session.save
      render 'show'
    else
      render 'new'
    end
  end
  
  def edit
    @session = Session.find(params[:id])
    @workshop = @session.workshop
    
    respond_to do |format|
      format.js
    end
  end
  
  def update
    @workshop = Workshop.find(params[:workshop_id])
    @session = Session.find(params[:id])
    if @session.update_attributes(params[:session])
      render 'show'
    else
      render 'edit'
    end
  end
  
  def destroy
    @workshop = Workshop.find(params[:workshop_id])
    Session.find(params[:id]).destroy
    
    respond_to do |format|
      format.js
    end
  end
end
