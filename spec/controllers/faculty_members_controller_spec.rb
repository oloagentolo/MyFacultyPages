require 'spec_helper'

describe FacultyMembersController do
  

  describe "GET request for 'index'" do
    it 'should be successful' do
      get :index
      response.should be_success
    end
  end

  describe "GET request for 'show'" do
    before(:each) do
      @faculty_member = FactoryGirl.create(:faculty_member)
    end

    it 'should be successful' do
      get :show, :id => @faculty_member
      response.should be_success
    end

    it 'should have the correct title' do
      get :show, :id => @faculty_member
      response.should have_selector('title', :content => "#{@faculty_member.first_name} #{@faculty_member.last_name}")
    end
  end
end
