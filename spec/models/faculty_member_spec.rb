require 'spec_helper'

describe FacultyMember do
  before(:each) do
  	@faculty = FactoryGirl.create(:faculty_member)
  end

  describe 'instantiation' do
    it 'should require a last name' do
      @faculty.last_name = ''
      @faculty.should_not be_valid
    end

    it 'should require a first name' do
      @faculty.first_name = ''
      @faculty.should_not be_valid
    end

    it 'should require a position' do
      @faculty.position = ''
      @faculty.should_not be_valid
    end

    it 'should require a department' do
      @faculty.department = ''
      @faculty.should_not be_valid
    end

    it 'should require a university ID' do
      @faculty.university_id = nil
      @faculty.should_not be_valid
    end

    it 'should require an email address' do
      @faculty.email = ''
      @faculty.should_not be_valid
    end
  end
  
  describe 'course associations' do
    before(:each) do
      @course = FactoryGirl.create(:course, :faculty_member => @faculty)
    end

    it 'should have a courses attribute' do
      @faculty.should respond_to(:courses)
    end

    it 'should destroy associated courses upon faculty member deletion' do
      @faculty.destroy
      Course.find_by_id(@course.id).should be_nil
    end
  end

  describe 'with research associations' do
    before(:each) do
      @research = FactoryGirl.create(:research, :faculty_member => @faculty)
    end

    it 'should have a researches attribute' do
      @faculty.should respond_to(:researches)
    end

    it 'should destroy associated researches upon faculty member deletion' do
      @faculty.destroy
      Research.find_by_id(@research.id).should be_nil
    end
  end

  describe 'with publication associations' do
    before(:each) do
      @publication = FactoryGirl.create(:publication, :faculty_member => @faculty)
    end

    it 'should have a publications attribute' do
      @faculty.should respond_to(:publications)
    end

    it 'should destroy associated publications upon faculty member deletion' do
      @faculty.destroy
      Publication.find_by_id(@publication.id).should be_nil
    end
  end

  describe 'with degree associations' do
    before(:each) do
      @degree = FactoryGirl.create(:degree, :faculty_member => @faculty)
    end

    it 'should have a degrees attribute' do
      @faculty.should respond_to(:degrees)
    end

    it 'should destroy associated degrees upon faculty member deletion' do
      @faculty.destroy
      Degree.find_by_id(@degree.id).should be_nil
    end
  end

  describe 'with employment associations' do
    before(:each) do
      @employment = FactoryGirl.create(:employment, :faculty_member => @faculty)
    end

    it 'should have an employments attribute' do
      @faculty.should respond_to(:employments)
    end

    it 'should destroy the associated employments upon faculty member deletion' do
      @faculty.destroy
      Employment.find_by_id(@employment.id).should be_nil
    end
  end

  describe 'with award associations' do
    before(:each) do
      @award = FactoryGirl.create(:award, :faculty_member => @faculty)
    end

    it 'should have an awards attribute' do
      @faculty.should respond_to(:awards)
    end

    it 'should destroy the associated awards upon faculty member deletion' do
      @faculty.destroy
      Award.find_by_id(@award.id).should be_nil
    end
  end
end
