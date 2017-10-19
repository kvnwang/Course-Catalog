class Course < ApplicationRecord
  has_many :enrollments

  def self.search(search)
  where("name LIKE ?", "%#{search.downcase}%")
  end

  def self.subject(search)
    where("subject_id LIKE ?", "%#{search.downcase}%")
  end

  def self.both(arg1,arg2)
    where("name LIKE ? AND LOWER(subject_id) LIKE ?", "%#{arg1.downcase}%", "%#{arg2.downcase}%")
  end
end
