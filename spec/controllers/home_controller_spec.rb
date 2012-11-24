require 'spec_helper'

describe HomeController do

  describe "GET 'my_sessions'" do
    it "returns http success" do
      get 'my_sessions'
      response.should be_success
    end
  end

end
