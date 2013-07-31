class FacultyMembersController < ApplicationController
  before_action :set_faculty_member, only: [:show]
  before_action :set_faculty_view, except: [:index]

  def index
    @faculty_members = FacultyMember.all
  end

  def show
    @title = "#{@faculty_member.first_name} #{@faculty_member.last_name}"
  end

  private
  
    def set_faculty_member
      @faculty_member = FacultyMember.find(params[:id])
    end

    def set_faculty_view
      @faculty_view = true
    end
end
