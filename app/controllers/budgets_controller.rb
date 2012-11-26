class BudgetsController < ApplicationController
  def edit
    @workshop = Workshop.find(params[:workshop_id])
    @budget = @workshop.budget
  end
  
  def update
    @workshop = Workshop.find(params[:workshop_id])
    @budget = @workshop.budget
    if @workshop.budget.update_attributes(params[:budget])
      flash[:notice] = "Budget updated successfully."
      redirect_to edit_workshop_budget_path(@workshop)
    else
      render 'edit'
    end
  end
end
