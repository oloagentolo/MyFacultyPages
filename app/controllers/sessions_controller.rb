class SessionsController < ApplicationController
  def new
    @title = 'Sign in'
  end

  def create
    faculty = FacultyMember.find_by(university_id: params[:session][:university_id])
    if faculty && faculty.authenticate(params[:session][:password])
      sign_in faculty
      redirect_to faculty
    else
      @title = 'Sign in'
      flash.now[:error] = 'Invalid ID/password combination'
      render 'new'
    end
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end
end
