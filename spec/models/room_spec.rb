require 'spec_helper'

describe Room do
	 before (:each) do 
   		@room = Room.new(description: 'test@test.com',
   						 room_no: 'qweasd',
   						 location: 'building A')
  
 end

 it "room requires a room number" do
 	@room.room_no = ''
 	@room.valid?.should == false
 end

 it "room requries a location" do
 	@room.location = ''
 	@room.valid?.should  == false
 end

 it "room requires both room and location" do
 	@room.valid?.should == true
 end


end
