class Publication < ActiveRecord::Base
  validates_presence_of :title, :summary, :faculty_member_id
  belongs_to :faculty_member
end
