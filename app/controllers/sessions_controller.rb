class SessionsController < ApplicationController
  def new
    @title = 'Sign in'
  end

  def create
    faculty = FacultyMember.find_by(university_id: params[:session][:university_id])
    if faculty && faculty.authenticate(params[:session][:password])
      sign_in faculty
    else
      flash.now[:error] = 'Invalid ID/password combination'
      render 'new'
    end
  end
  
  def destroy 
  end
end
