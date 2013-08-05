class CoursesController < ApplicationController
	before_action :set_course, only: [:show, :edit, :update, :destroy]

  def new
    @course = Course.new
  end

  def edit
  end

  def create
    @course = Course.new(course_params)
    @course.faculty_member_id = current_faculty.id
    respond_to do |format|
      if @course.save
        format.html { redirect_to courses_faculty_member_path(current_faculty), notice: 'Course was successfully created.' }
        format.json { render action: 'show', status: :created, location: root_path }
      else
        format.html { render action: 'new' }
        format.json { render json: root_path.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @course.update(course_params)
      flash[:success] = 'Course was successfully updated.'
      redirect_to courses_faculty_member_path(current_faculty)
    else
      render action: 'edit'
    end
  end

  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_faculty_member_path(current_faculty) }
      format.json { head :no_content }
    end
  end

  private
    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:dept_code, :course_no, :name, :term, :year, :summary, :faculty_member_id)
    end
end
