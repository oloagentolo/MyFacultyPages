require 'spec_helper'

describe Course do
  before(:each) do
  	@faculty = FactoryGirl.create(:faculty_member)
  	@attr = { :dept_code => 'COSC', :course_no => 1234, :name => 'Intro to foo',
  	  :term => 'Fall', :year => 2013 }
  end

  describe 'instantiation' do
    it 'should require a department code' do
      no_dept_code_course = Course.new(@attr.merge(:dept_code => ''))
      no_dept_code_course.should_not be_valid
    end

    it 'should require a course number' do
      no_course_number_course = Course.new(@attr.merge(:course_no => nil))
      no_course_number_course.should_not be_valid
    end

    it 'should require a name' do
      no_name_course = Course.new(@attr.merge(:name => ''))
      no_name_course.should_not be_valid
    end

    it 'should require a term' do
      no_term_course = Course.new(@attr.merge(:term => ''))
      no_term_course.should_not be_valid
    end

    it 'should require a year' do
      no_year_course = Course.new(@attr.merge(:year => nil))
      no_year_course.should_not be_valid
    end

    it 'should create a new instance given valid attributes' do
    	@faculty.courses.create!(@attr)
    end
  end

  describe 'faculty member associations' do
  	before(:each) do
  		@course = @faculty.courses.create(@attr)
  	end

    it 'should have a faculty member attribute' do
      @course.should respond_to(:faculty_member)
    end
  end
end
