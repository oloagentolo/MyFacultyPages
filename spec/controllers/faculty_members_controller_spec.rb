require 'spec_helper'

describe FacultyMembersController do
  describe "GET request for 'index'" do
    it 'should be successful' do
      get :index
      response.should be_success
    end
  end
end
