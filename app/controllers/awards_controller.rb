class AwardsController < ApplicationController
  before_action :set_award, only: [:show, :edit, :update, :destroy]

  def new
    @award = Award.new
  end

  def edit
  end

  def create
    @award = Award.new(award_params)
    @award.faculty_member_id = current_faculty.id

    respond_to do |format|
      if @award.save
        format.html { redirect_to curriculum_vitae_faculty_member_path(current_faculty), notice: 'Award was successfully created.' }
        format.json { render action: 'show', status: :created, location: root_path }
      else
        format.html { render action: 'new' }
        format.json { render json: root_path.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @award.update(award_params)
        format.html { redirect_to curriculum_vitae_faculty_member_path(current_faculty), notice: 'Award was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: root_path.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @award.destroy
    respond_to do |format|
      format.html { redirect_to curriculum_vitae_faculty_member_path(current_faculty) }
      format.json { head :no_content }
    end
  end

  private
    def set_award
      @award = Award.find(params[:id])
    end

    def award_params
      params.require(:award).permit(:title, :issuer, :issue_date, :summary, :faculty_member_id)
    end
end