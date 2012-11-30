require 'spec_helper'

describe WorkshopsController do

it "can create a workshop" do
	@controller = WorkshopsController.new
	@controller.create(:title => 'asd')



end 

end
