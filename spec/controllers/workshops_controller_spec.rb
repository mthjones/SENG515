require 'spec_helper'

describe WorkshopsController do

it "can create a workshop" do
	@controller = WorkshopsController.new
	@workshop
	@controller.create(:title => 'asd')




end 

end
