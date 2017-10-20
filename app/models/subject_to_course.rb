class SubjectToCourse < ApplicationRecord
  belongs_to :subject
  belongs_to :course

end
