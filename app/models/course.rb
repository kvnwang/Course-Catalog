class Course < ApplicationRecord
  has_many :enrollments
  has_many :subject_to_courses
  has_many :subjects, :through => :subject_to_courses  # Edit :needs to be plural same as the has_many relationship

  def self.search(search, browse)
    if search.present? && browse.present?
      search=search.downcase
      course=Course.where("name LIKE ?", "%#{search}%").merge (Subject.find_by subject_id: browse).courses
    elsif search.present? && !browse.present?
      search=search.downcase
      course=Course.where("name LIKE ?", "%#{search}%")
    elsif !search.present? && browse.present?
      course=(Subject.find_by subject_id: browse).courses
    else
      course = Course.all.order('created_at DESC')
    end
    return course


  end
end
