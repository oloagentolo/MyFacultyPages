require 'spec_helper'

describe FacultyMember do
  before(:each) do
    @attr = { :last_name => 'Last', :first_name => 'First', :position => 'Professor', 
      :department => 'Computer Science', :university_id => 123456, :email => 'FirstLast@example.com' }
  end

  describe 'instantiation' do
    it 'should require a last name' do
      no_last_name_faculty = FacultyMember.new(@attr.merge(:last_name => ''))
      no_last_name_faculty.should_not be_valid
    end

    it 'should require a first name' do
      no_first_name_faculty = FacultyMember.new(@attr.merge(:first_name => ''))
      no_first_name_faculty.should_not be_valid
    end

    it 'should require a position' do
      no_position_faculty = FacultyMember.new(@attr.merge(:position => ''))
      no_position_faculty.should_not be_valid
    end

    it 'should require a department' do
      no_department_faculty = FacultyMember.new(@attr.merge(:department => ''))
      no_department_faculty.should_not be_valid
    end

    it 'should require a university ID' do
      no_id_faculty = FacultyMember.new(@attr.merge(:university_id => nil))
      no_id_faculty.should_not be_valid
    end

    it 'should require an email address' do
      no_email_faculty = FacultyMember.new(@attr.merge(:email => ''))
      no_email_faculty.should_not be_valid
    end
  end
end
