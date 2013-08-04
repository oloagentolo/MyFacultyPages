module SessionsHelper
  def sign_in(faculty)
    remember_token = FacultyMember.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    faculty.update_attribute(:remember_token, FacultyMember.encrypt(remember_token))
    self.current_faculty = faculty
  end

  def current_faculty=(faculty)
    @current_faculty = faculty
  end

  def current_faculty
    remember_token = FacultyMember.encrypt(cookies[:remember_token])
    @current_faculty ||= FacultyMember.find_by(remember_token: remember_token)
  end

  def signed_in?
    !current_faculty.nil?
  end
end
