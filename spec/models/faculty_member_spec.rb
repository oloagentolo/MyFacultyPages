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
end
