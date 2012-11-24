class MyWorkshopsController < ApplicationController
	def show
	  @workshops = Workshop.all.reverse
      session[:return_to] = request.url
    end
