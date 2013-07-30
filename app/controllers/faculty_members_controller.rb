class FacultyMembersController < ApplicationController
  def index
    @faculty_members = FacultyMember.all
  end
end
