class FacultyMembersController < ApplicationController
  before_action :set_faculty_member, only: [:show]

  def index
  	@index_view = true
    @faculty_members = FacultyMember.all
  end

  def show
    @title = "#{@faculty_member.first_name} #{@faculty_member.last_name}"
  end

  private
  
    def set_faculty_member
      @faculty_member = FacultyMember.find(params[:id])
    end
end
