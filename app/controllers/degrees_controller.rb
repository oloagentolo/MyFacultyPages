class DegreesController < ApplicationController
  before_action :set_degree, only: [:show, :edit, :update, :destroy]

  def new
    @degree = Degree.new
  end

  def edit
  end

  def create
    @degree = Degree.new(degree_params)
    @degree.faculty_member_id = current_faculty.id

    respond_to do |format|
      if @degree.save
        format.html { redirect_to curriculum_vitae_faculty_member_path(current_faculty), notice: 'Degree was successfully created.' }
        format.json { render action: 'show', status: :created, location: root_path }
      else
        format.html { render action: 'new' }
        format.json { render json: root_path.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @degree.update(degree_params)
        format.html { redirect_to curriculum_vitae_faculty_member_path(current_faculty), notice: 'Degree was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: root_path.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @degree.destroy
    respond_to do |format|
      format.html { redirect_to curriculum_vitae_faculty_member_path(current_faculty) }
      format.json { head :no_content }
    end
  end

  private
    def set_degree
      @degree = Degree.find(params[:id])
    end

    def degree_params
      params.require(:degree).permit(:title, :field_of_study, :institution, :issue_date, :faculty_member_id)
    end
end