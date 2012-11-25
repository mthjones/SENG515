class BudgetsController < ApplicationController
  def show
    @workshop = Workshop.find(params[:workshop_id])
    @budget = @workshop.budget
  end
  
  def update
    
  end
end
