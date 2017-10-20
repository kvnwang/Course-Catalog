class Subject < ApplicationRecord
  has_many :subject_to_courses
  has_many :courses, :through => :subject_to_courses  # Edit :needs to be plural same as the has_many relationship




end
