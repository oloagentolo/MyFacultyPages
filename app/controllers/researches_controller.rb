class ResearchesController < ApplicationController
  before_action :set_research, only: [:show, :edit, :update, :destroy]

  def new
    @research = Research.new
  end

  def edit
  end

  def create
    @research = Research.new(research_params)
    @research.faculty_member_id = current_faculty.id
    respond_to do |format|
      if @research.save
        format.html { redirect_to researches_faculty_member_path(current_faculty), notice: 'Research was successfully created.' }
        format.json { render action: 'show', status: :created, location: root_path }
      else
        format.html { render action: 'new' }
        format.json { render json: root_path.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @research.update(research_params)
        format.html { redirect_to researches_faculty_member_path(current_faculty), notice: 'Research was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: root_path.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @research.destroy
    respond_to do |format|
      format.html { redirect_to researches_faculty_member_path(current_faculty) }
      format.json { head :no_content }
    end
  end

  private
    def set_research
      @research = Research.find(params[:id])
    end

    def research_params
      params.require(:research).permit(:topic, :start_date, :end_date, :summary, :faculty_member_id)
    end
end
