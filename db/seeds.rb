# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


FacultyMember.create(first_name: 'John', last_name: 'Doe', position: 'Professor',
  department: 'Computer Science', university_id: 123456, email: 'johndoe@uastalia.edu')

Course.create(dept_code: 'COSC', course_no: 1410, name: 'Introduction to C++', term: 'Fall', year: 2013,
  summary: 'Introduction to the C++ programming language.', faculty_member_id: 1)

Course.create(dept_code: 'COSC', course_no: 1320, name: 'Introduction to Java', term: 'Spring', year: 2014,
  summary: 'Introduction to the Java programming language.', faculty_member_id: 1)

Course.create(dept_code: 'COSC', course_no: 2410, name: 'Logic and Design Fundamentals', term: 'Fall', year: 2014,
  summary: 'Logical operations within computer hardware and simplification of circuits.', faculty_member_id: 1)

Course.create(dept_code: 'COSC', course_no: 3310, name: 'Software Engineering', term: 'Spring', year: 2015,
  summary: 'Fundamental practices for developing software to industry standards.', faculty_member_id: 1)