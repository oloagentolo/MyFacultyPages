class EmploymentsController < ApplicationController
  before_filter :authorize
  before_action :set_employment, only: [:show, :edit, :update, :destroy]

  def new
    @title = 'Add employment'
    @employment = Employment.new
  end

  def edit
    @title = 'Edit employment'
  end

  def create
    @employment = Employment.new(employment_params)
    @employment.faculty_member_id = current_faculty.id

    respond_to do |format|
      if @employment.save
        format.html { redirect_to curriculum_vitae_faculty_member_path(current_faculty), notice: 'Employment was successfully created.' }
        format.json { render action: 'show', status: :created, location: root_path }
      else
        @title = 'Add employment'
        format.html { render action: 'new' }
        format.json { render json: root_path.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @employment.update(employment_params)
        format.html { redirect_to curriculum_vitae_faculty_member_path(current_faculty), notice: 'Employment was successfully updated.' }
        format.json { head :no_content }
      else
        @title = 'Edit employment'
        format.html { render action: 'edit' }
        format.json { render json: root_path.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @employment.destroy
    respond_to do |format|
      format.html { redirect_to curriculum_vitae_faculty_member_path(current_faculty) }
      format.json { head :no_content }
    end
  end

  private
    def set_employment
      @employment = Employment.find(params[:id])
    end

    def employment_params
      params.require(:employment).permit(:company, :position, :start_date, :end_date, :summary, :faculty_member_id)
    end
end