
require 'json'

instruct = ActiveSupport::JSON.decode(File.read('db/instructor.json'))
instruct.each do |x|
  Instructor.create(first: x['first'], last: x['last'], email: x['email'])
end


subj=ActiveSupport::JSON.decode(File.read('db/subject.json'))
subj.each do |x|
  Subject.create!(subject_id:x['id'], name: x['name'])
end


course = ActiveSupport::JSON.decode(File.read('db/course.json'))
course.each do |a|
  c = Course.create!(name:a['name'],description:a['description'],code:a['code'])

  a['subjects'].each do |s|
    if !Subject.find_by(subject_id: s['id']).nil?
      SubjectToCourse.create(course_id: c.id, subject_id: Subject.find_by(subject_id: s['id'])['id'])
    end
  end

end
