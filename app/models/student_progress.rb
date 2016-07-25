# encoding: utf-8
#
class StudentProgress < ApplicationRecord
  belongs_to :student
  belongs_to :lesson_part
  belongs_to :lesson # maybe useful for indexing and shorter query

  validates_uniqueness_of :student, scope: [:lesson_part]

  validates :student, :lesson_part, presence: true
end
