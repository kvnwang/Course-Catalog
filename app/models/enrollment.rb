class Enrollment < ApplicationRecord
  belongs_to :users
  belongs_to :courses
end
