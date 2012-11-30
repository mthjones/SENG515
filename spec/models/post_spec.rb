require 'spec_helper'

describe Post do
	 before (:each) do 
   		@post = Post.new(title: 'post test title',
   						 content: 'post test content',
   						 admin_only: true)
 end

 it "verify post needs a title to be valid" do
 	@post.title = ''
 	@post.valid?.should == false
 end


 it "verify post cannot have non alphanumeric title" do
 	@post.title = '#{)()()()()}'
 	@post.valid?.should
 end

 it "verify post needs content" do
 	@post.content = ''
 	@post.valid?.should == false
 end 

 it "verify post should be valid with bost title and content" do
 	@post.title = 'asd'
 	@post.content = 'asda'
 	@post.valid?
 end

end
