class WorkshopsController < ApplicationController
	def index
		@workshops = Workshop.all
	end

	def show

	end
end
