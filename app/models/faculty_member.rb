class FacultyMember < ActiveRecord::Base
  validates_presence_of :last_name, :first_name, :position, :department, :university_id, :email
  validates_length_of :phone, :is => 10

  has_many :courses, :dependent => :destroy
  has_many :researches, :dependent => :destroy
  has_many :publications, :dependent => :destroy
  has_many :degrees, :dependent => :destroy
  has_many :employments, :dependent => :destroy
  has_many :awards, :dependent => :destroy
  
  has_secure_password
end
