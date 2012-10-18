class WorkshopsController < ApplicationController
	def view_all
		@workshops = Workshop.all
	end
end
