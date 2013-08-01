class FacultyMembersController < ApplicationController
  before_action :set_faculty_member, except: [:index]
  before_action :set_faculty_view, except: [:index]

  def index
    @faculty_members = FacultyMember.all
  end

  def show
    @title = "#{@faculty_member.first_name} #{@faculty_member.last_name}"
  end

  def courses
    @title = "Courses taught by #{@faculty_member.first_name} #{@faculty_member.last_name}"
    @courses = Course.all
    @years = @courses.uniq.pluck(:year).reverse
  end

  def researches
    @title = "Research by #{@faculty_member.first_name} #{@faculty_member.last_name}"
    @researches = Research.all.sort_by { |r| [r.start_date, r.end_date] }.reverse
  end

  private
  
    def set_faculty_member
      @faculty_member = FacultyMember.find(params[:id])
    end

    def set_faculty_view
      @faculty_view = true
    end
end
