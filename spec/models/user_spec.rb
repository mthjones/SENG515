require 'spec_helper'

describe User do
   before (:each) do 
   		@user = User.new(email: 'test@test.com',
   						 password: 'qweasd')

   		@workshop = Workshop.new(title: "Test Workshop", 
  									description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed erat felis, ultricies non laoreet vitae, lobortis eget erat. Curabitur dapibus mollis erat, sed tristique dui imperdiet venenatis. Fusce ac lorem ac ante hendrerit dignissim. Donec justo enim, interdum gravida volutpat sit amet, facilisis ut eros. Praesent condimentum porta justo sit amet condimentum. Nunc dolor diam, lobortis sed venenatis sit amet, pulvinar et eros. Sed neque neque, gravida at rutrum et, scelerisque eget magna. Nunc a aliquet quam. Ut id quam massa, volutpat viverra velit. Integer rutrum, urna non adipiscing malesuada, nulla risus placerat enim, id ultricies metus lacus non nibh. Aenean eget mi et lectus scelerisque elementum.",
  									start_date: Date.today,
  									end_date: Date.today + 7.days)
		@session  = Session.new(title: "Test Session",
									description: "Test Session Description",
									start_datetime: Date.today,
  									end_datetime:   Date.today+1,
  									room_id: '1')
		@room     = Room.new(room_no: '1') 
   end

 it "should have valid password" do
 	@user.valid?.should == true
 	@user.password = ''

 	@user.valid?.should == false
 end


 it "should have valid email with @ sign" do
 	@user.valid?.should == true
 	@user.email = 'bob'
 	@user.valid?.should == false
 end


 it "password and conformation password should match" do
 	@user.valid?.should == true
 	@user.password_confirmation = 'xxxx'
 	@user.valid?.should == false
 end

it "should be able to register for a session" do
	@session.room = @room
	@session.workshop = @workshop
	session = @user.sessions.new
	session = @session

	@user.valid?.should == true

end

end
