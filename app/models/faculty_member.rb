class FacultyMember < ActiveRecord::Base
  validates_presence_of :last_name, :first_name, :position, :department, :university_id, :email

  has_many :courses
end
