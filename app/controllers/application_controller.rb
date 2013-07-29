class ApplicationController < ActionController::Base
  before_filter :current_faculty_member
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  
    def current_faculty_member
      @faculty_member = FacultyMember.first
    end
end
