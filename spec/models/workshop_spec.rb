require 'spec_helper'

describe Workshop do
  before { @workshop = Workshop.new(title: "Test Workshop", 
  									description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed erat felis, ultricies non laoreet vitae, lobortis eget erat. Curabitur dapibus mollis erat, sed tristique dui imperdiet venenatis. Fusce ac lorem ac ante hendrerit dignissim. Donec justo enim, interdum gravida volutpat sit amet, facilisis ut eros. Praesent condimentum porta justo sit amet condimentum. Nunc dolor diam, lobortis sed venenatis sit amet, pulvinar et eros. Sed neque neque, gravida at rutrum et, scelerisque eget magna. Nunc a aliquet quam. Ut id quam massa, volutpat viverra velit. Integer rutrum, urna non adipiscing malesuada, nulla risus placerat enim, id ultricies metus lacus non nibh. Aenean eget mi et lectus scelerisque elementum.",
  									start_date: Date.today,
  									end_date: Date.today + 7.days)}

  subject { @workshop }

  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:start_date) }
  it { should respond_to(:end_date) }

  # Make sure workshop is initially valid before testing validations
  it { should be_valid }
  describe "when title is not present" do
  	before { @workshop.title = " " }
  	it { should_not be_valid }
  end

  it { should be_valid }
  describe "when start_date is not present" do
  	before { @workshop.start_date = nil }
  	it { should_not be_valid }
  end

  it { should be_valid }
  describe "when end_date is not present" do
  	before { @workshop.end_date = nil }
  	it { should_not be_valid }
  end

  it "should validate end date is later than start date" do
    @workshop.start_date.should <= @workshop.end_date
    @workshop.start_date = @workshop.end_date + 1
    @workshop.valid?.should == false
  end

  it "should validate if the workshop has finished" do
    @workshop.end_date = Date.today - 1
    @workshop.finished?.should == true
  end

  it "should validate if the workshop is in progress" do
    @workshop.start_date = Date.today - 1
    @workshop.in_progress?.should == true
  end



end
