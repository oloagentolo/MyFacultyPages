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
    c.association    :faculty_member
  end

  factory :research do |r|
    r.topic          'Sample Research Topic'
    r.start_date     Date.new(1997, 1, 1)
    r.end_date       Date.today
    r.summary        'This is a sample research summary.'
    r.association    :faculty_member
  end

  factory :publication do |p|
    p.title          'Sample Publication Title'
    p.summary        'This publication is a textbook that introduces students to foo'
    p.year           2000
    p.association    :faculty_member
  end
end
