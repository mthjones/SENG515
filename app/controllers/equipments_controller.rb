class EquipmentsController < ApplicationController
  
 def index
     @Equipments = Equipment.all.reverse
      session[:return_to] = request.url
 end
  
end
