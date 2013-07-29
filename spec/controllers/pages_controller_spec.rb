require 'spec_helper'

describe PagesController do
  render_views  

  describe "GET request for 'home'" do
    it 'should be successful' do
      get :home
      response.should be_success
    end

    it 'should have the correct title' do
      get :home
      response.should have_selector('title', :content => 'John Doe') # Hardcoded for now
    end
  end
end
