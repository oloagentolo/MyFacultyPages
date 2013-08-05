
class FacultyMembersController < ApplicationController
  before_filter :authorize, only: [ :edit, :update ]
  before_action :set_faculty_member, except: [ :index ]
  before_action :set_faculty_view, except: [ :index ]
  before_action :correct_faculty, except: [ :index ]

  def index
    @faculty_members = FacultyMember.all
  end

  def show
    @title = "#{@faculty_member.first_name} #{@faculty_member.last_name}"
  end

  def edit
    @title = 'Edit profile'
  end

  def update
    if @faculty.update(faculty_member_params)
      flash[:success] = 'Successfully updated profile.'
      redirect_to @faculty_member
    else
      @title = 'Edit profile'
      render action: 'edit'
    end
  end

  def courses
    @title = "Courses taught by #{@faculty_member.first_name} #{@faculty_member.last_name}"
    @courses = @faculty_member.courses.sort_by { |c| [c.year, c.term] }.reverse
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
    @degrees = @faculty_member.degrees
    @publications = @faculty_member.publications
    @researches = @faculty_member.researches
    @employments = @faculty_member.employments
    @awards = @faculty_member.awards
  end

  def contact_details
    @title = "Contact Details for #{@faculty_member.first_name} #{@faculty_member.last_name}"
  end

  private
  
    def set_faculty_member
      @faculty_member = FacultyMember.find(params[:id])
    end

    def set_faculty_view
      @faculty_view = true
    end

    def correct_faculty
      @faculty = FacultyMember.find(params[:id])
      if signed_in? && !current_faculty?(@faculty)
        flash[:notice] = 'Please log out before leaving page.'
        redirect_to current_faculty
      end
    end

    def faculty_member_params
      params.require(:faculty_member).permit(:first_name, :last_name, :position, :department, :office, :phone,
        :summary, :biography)
    end
end
