
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
    @courses = @faculty_member.courses
    @years = Course.all.where(:faculty_member_id => @faculty_member.id).uniq.pluck(:year).reverse
  end

  def researches
    @title = "Research by #{@faculty_member.first_name} #{@faculty_member.last_name}"
    @researches = @faculty_member.researches.sort_by { |r| r.end_date.blank? ? Date.today : r.end_date }.reverse
  end

  def publications
    @title = "Publications by #{@faculty_member.first_name} #{@faculty_member.last_name}"
    @publications = @faculty_member.publications
  end

  def curriculum_vitae
    @title = "Curriculum Vitae for #{@faculty_member.first_name} #{@faculty_member.last_name}"
  end

  private
  
    def set_faculty_member
      @faculty_member = FacultyMember.find(params[:id])
    end

    def set_faculty_view
      @faculty_view = true
    end
end
