class StudentProgress < ApplicationRecord
  belongs_to :student
  belongs_to :lesson_part
  belongs_to :lesson # maybe useful for indexing and shorter query
end
