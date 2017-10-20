class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :course

  self.search(search)
  where("user_id LIKE ?", "%#{search}%")
  end
end
