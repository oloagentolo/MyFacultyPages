require 'spec_helper'

describe FacultyMembersController do
  render_views  

  describe "GET request for 'index'" do
    it 'should be successful' do
      get :index
      response.should be_success
    end
  end

  describe "GET request for 'show'" do
    before(:each) do
      @faculty = FactoryGirl.create(:faculty_member)
    end

    it 'should be successful' do
      get :show, :id => @faculty
      response.should be_success
    end

    it 'should have the correct title' do
      get :show, :id => @faculty
      response.should have_selector('title', 
        :content => "#{@faculty.first_name} #{@faculty.last_name}")
    end
  end

  describe "GET request for 'courses'" do
    before(:each) do
      @faculty = FactoryGirl.create(:faculty_member)
    end

    it 'should be successful' do
      get :courses, :id => @faculty
      response.should be_success
    end

    it 'should have the correct title' do
      get :courses, :id => @faculty
      response.should have_selector('title', 
        :content => "Courses taught by #{@faculty.first_name} #{@faculty.last_name}")
    end
  end
end
