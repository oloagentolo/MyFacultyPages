class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  protected
  
    def authorize
      unless signed_in?
        flash[:notice] = 'You do not have permission to visit this page. Please sign in.'
        redirect_to signin_path
      end
    end
end
