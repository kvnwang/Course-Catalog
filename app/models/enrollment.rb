class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :course

  def self.search(search)
    return Enrollment.where("user_id = ? ", search)
  end
end
