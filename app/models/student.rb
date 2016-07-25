# encoding: utf-8
#
class Student < ApplicationRecord
  include Grape::Entity::DSL
  entity :id, :name do
    expose :student_progresses
  end

  has_many :school_class_students
  has_many :school_classes, through: :school_class_students

  has_many :student_progresses
  has_many :lesson_parts, through: :student_progresses
  has_many :lessons, through: :student_progresses

  belongs_to :school
  belongs_to :current_progress, class_name: 'LessonPart', foreign_key: :lesson_part_id, required: false
  validates :school, presence: true

  def complete_course!(lesson_part)
    raise 'required lesson part to complete' unless lesson_part.is_a?(LessonPart)
    raise 'missing required lesson part to complete' unless lesson_part

    if valid_lesson_part?(lesson_part)
      LessonPart.transaction do
        self.current_progress = lesson_part
        self.save!
        student_progresses.create!(lesson_part: lesson_part, lesson: lesson_part.lesson)
      end
    else
      raise ::Exceptions::InvalidCourse, 'Invalid lesson part to complete.'
    end
  end

  def valid_lesson_part?(lesson_part)
    if current_progress
      if current_progress.next_item
        current_progress.next_item == lesson_part.id ? true : false
      else
        lesson = Lesson.find(current_progress.lesson.next_item)
        lesson.sequenced_lesson_parts.first.id == lesson_part.id ? true : false
      end
    else
      first_lesson = Lesson.includes(:sequences).find(school.sequences.first.try(:sequence_ids).try(:first))
      first_lesson.sequences.first.sequence_ids.first == lesson_part.id
    end
  end
end