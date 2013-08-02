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

  describe 'research associations' do
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

  describe 'publication associations' do
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
end
