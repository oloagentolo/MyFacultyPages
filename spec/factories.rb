FactoryGirl.define do
  factory :faculty_member do |f|
    f.last_name      'SampleLast'
    f.first_name     'SampleFirst'
    f.position       'Professor'
    f.department     'Computer Science'
    f.summary        'Sample summary'
    f.biography      ''
    f.university_id  123456
    f.email          'Sample@example.com'
    f.phone          1234567890
    f.office         'PGH 123'
  end

  factory :course do |c|
    c.dept_code      'COSC'
    c.course_no      1234
    c.name           'Introduction to Computer Science'
    c.term           'Fall'
    c.year           2013
    c.summary        'This course introduces students to computer science'
  end
end
