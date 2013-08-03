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

  describe "GET request for 'researches'" do
    before(:each) do
      @faculty = FactoryGirl.create(:faculty_member)
    end

    it 'should be successful' do
      get :researches, :id => @faculty
      response.should be_success
    end

    it 'should have the correct title' do
      get :researches, :id => @faculty
      response.should have_selector('title',
        :content => "Research by #{@faculty.first_name} #{@faculty.last_name}")
    end
  end

  describe "GET request for 'publications'" do
    before(:each) do
      @faculty = FactoryGirl.create(:faculty_member)
    end

    it 'should be successful' do
      get :publications, :id => @faculty
      response.should be_success
    end

    it 'should have the correct title' do
      get :publications, :id => @faculty
      response.should have_selector('title',
        :content => "Publications by #{@faculty.first_name} #{@faculty.last_name}")
    end
  end

  describe "GET request for 'curriculum vitae'" do
    before(:each) do
      @faculty = FactoryGirl.create(:faculty_member)
    end

    it 'should be successful' do
      get :curriculum_vitae, :id => @faculty
      response.should be_success
    end

    it 'should have the correct title' do
      get :curriculum_vitae, :id => @faculty
      response.should have_selector('title', 
        :content => "Curriculum Vitae for #{@faculty.first_name} #{@faculty.last_name}")
    end
  end

  describe "GET request for 'contact details'" do
    before(:each) do
      @faculty = FactoryGirl.create(:faculty_member)
    end

    it 'should be successful' do
      get :contact_details, :id => @faculty
      response.should be_success
    end

    it 'should have the correct title' do
      get :contact_details, :id => @faculty
      response.should have_selector('title',
        :content => "Contact Details for #{@faculty.first_name} #{@faculty.last_name}")
    end
  end
end
