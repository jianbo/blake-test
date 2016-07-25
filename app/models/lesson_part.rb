# encoding: utf-8
#
class LessonPart < ApplicationRecord
  include Sequenceable

  validates :lesson, presence: true

  has_many :student_progresses
  has_many :students, through: :student_progresses

  belongs_to :lesson
  sequenceable :lesson
end
