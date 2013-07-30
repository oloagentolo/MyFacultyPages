FactoryGirl.define do
  factory :faculty_member do
    last_name      'SampleLast'
    first_name     'SampleFirst'
    position       'Professor'
    department     'Computer Science'
    summary        'Sample summary'
    biography      ''
    university_id  123456
    email          'Sample@example.com'
    phone          1234567890
    office         'PGH 123'
  end
end
