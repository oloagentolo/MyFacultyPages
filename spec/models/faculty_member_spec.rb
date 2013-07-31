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
      @course = FactoryGirl.create(:course)
    end

    it 'should have a courses attribute' do
      @faculty.should respond_to(:courses)
    end
  end
end
