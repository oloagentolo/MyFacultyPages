require 'spec_helper'

describe Course do
  before(:each) do
  	@course = FactoryGirl.create(:course)
  end

  describe 'instantiation' do
    it 'should require a department code' do
      @course.dept_code = ''
      @course.should_not be_valid
    end

    it 'should require a course number' do
      @course.course_no = nil
      @course.should_not be_valid
    end

    it 'should require a name' do
      @course.name = ''
      @course.should_not be_valid
    end

    it 'should require a term' do
      @course.term = ''
      @course.should_not be_valid
    end

    it 'should require a year' do
      @course.year = nil
      @course.should_not be_valid
    end
  end

  describe 'faculty member associations' do
    it 'should have a worker attribute' do
      @course.should respond_to(:faculty_member)
    end
  end
end
