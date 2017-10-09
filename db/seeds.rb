
require 'json'
# reads in instructor
  file_instruct=File.read('db/instructor.json')
instruct=JSON.parse(file_instruct)

instruct.each do |x|
  y=x.slice("first", "last", "email")
  Instructor.create(y)
end 


file_subject=File.read('db/subject.json')
subj=JSON.parse(file_subject)

subj.each do |x|
	y=x.slice("name")
	Subject.create(y)
end 



file_course=File.read('db/course.json')
course=JSON.parse(file_course)
course.each do |x|
	x=x.slice("name", "description", "code")
	Course.create(x)
end 






# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
