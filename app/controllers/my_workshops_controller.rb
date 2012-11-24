class MyWorkshopsController < ApplicationController
	def show
	  @workshops = Workshop.all.reverse
      session[:return_to] = request.url
      @workshop = Workshop.new(title:'title of workshop', description:'desc')
      rescue
    	flash[:error] = "You are not currently registered in any workshops"
    	redirect_to root_path
	end
end
