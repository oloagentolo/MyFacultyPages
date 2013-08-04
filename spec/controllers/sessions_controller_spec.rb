require 'spec_helper'

describe SessionsController do
	render_views

	describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end 

    it "should have the right title" do
      get :new
      response.should have_selector('title', :content => 'Sign in')
    end
  end

  describe "POST request for 'create'" do
  	describe 'with invalid signin' do
  		before(:each) do
  			@attr = { :university_id => 123, :password => 'invalid' }
  		end

  		it 'should re-render the new page' do
  			post :create, :session => @attr
  			response.should render_template('new')
  		end

  		it 'should have the right title' do
  			post :create, :session => @attr
  			response.should have_selector('title', :content => 'Sign in')
  		end
  	end

    describe 'with valid signin' do
      before(:each) do
        @faculty = FactoryGirl.create(:faculty_member)
        @attr = { :university_id => @faculty.university_id, :password => @faculty.password }
      end

      it 'should sign the faculty member in' do
        post :create, :session => @attr
        controller.current_faculty.should == @faculty
        controller.should be_signed_in
      end

      it "should redirect to the faculty member's home page" do
        post :create, :session => @attr
        response.should redirect_to(faculty_member_path(@faculty))
      end
    end
  end
end
