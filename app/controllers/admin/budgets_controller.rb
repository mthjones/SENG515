class Admin::BudgetsController < ApplicationController
  before_filter :authenticate_admin!
  
  def index
    @budgets = Budget.all
  end
end
