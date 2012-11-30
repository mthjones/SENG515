require 'spec_helper'

describe WorkshopsController do
 
   def setup
    @controller = UnderTestController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
   end

  describe "GET 'index'" do
   it "should be successful" do
     get 'index'
     response.should be_success
   end
  end

  describe "GET 'show'" do
   it "should be successful" do
     get 'index'
     response.should be_success
   end
  end



end
