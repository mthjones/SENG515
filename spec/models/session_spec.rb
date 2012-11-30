require 'spec_helper'

describe Session do
   before (:each) do @workshop = Workshop.new(title: "Test Workshop", 
  									description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed erat felis, ultricies non laoreet vitae, lobortis eget erat. Curabitur dapibus mollis erat, sed tristique dui imperdiet venenatis. Fusce ac lorem ac ante hendrerit dignissim. Donec justo enim, interdum gravida volutpat sit amet, facilisis ut eros. Praesent condimentum porta justo sit amet condimentum. Nunc dolor diam, lobortis sed venenatis sit amet, pulvinar et eros. Sed neque neque, gravida at rutrum et, scelerisque eget magna. Nunc a aliquet quam. Ut id quam massa, volutpat viverra velit. Integer rutrum, urna non adipiscing malesuada, nulla risus placerat enim, id ultricies metus lacus non nibh. Aenean eget mi et lectus scelerisque elementum.",
  									start_date: Date.today,
  									end_date: Date.today + 7.days)
			@session  = Session.new(title: "Test Session",
									description: "Test Session Description",
									start_datetime: Date.today,
  									end_datetime:   Date.today+1,
  									room_id: '1')

			@session_b  = Session.new(title: "Test SessionB",
									description: "Test SessionB Description",
									start_datetime: Date.today,
  									end_datetime:   Date.today+1,
  									room_id: '1')

			@room     = Room.new(room_no: '1') 
end

  	it "Check title equals" do
   		@session.title.should == 'Test Session'
  	end

	it "Check session dates do not overlap" do
  		
	end

	it "has to be at least 15 minutes long" do
    	 @session.end_datetime.should_not == @session.start_datetime 
    	 @session.end_datetime = @session.start_datetime
    	 @session.room     =  @room
    	 @session.workshop = @workshop
    	 @session.valid?
    end

    it "has more than 15 minutes in a session" do
    	 @session.end_datetime.should_not == @session.start_datetime 
    	 @session.end_datetime 			  = @session.start_datetime + 1
    	 @session.room     				  =  @room
    	 @session.workshop 				  = @workshop
    	 @session.valid?.should == false
    	
    end

    it "is within workshop date range" do
    	@session.start_datetime.should >= @workshop.start_date
    	@session.end_datetime.should <= @workshop.end_date
    end

    it "is before workshop date range" do
    	@session.room = @room
    	@session.workshop = @workshop
    	@session.start_datetime = @workshop.start_date - 2
    	@session.end_datetime   = @workshop.start_date - 1

    	@session.valid?.should == false
    end

    it "has to have a room not double booked" do
    	 @session.room     =  @room
    	 @session.workshop =  @workshop

    	 @session_b.room     =  @room
    	 @session_b.workshop =  @workshop
    	 @session_b.valid?
    end 
end
