# encoding: utf-8
#
class Teacher < ApplicationRecord
  has_many :school_class_teachers
  has_many :school_classes, through: :school_class_teachers

  def all_students
    Student.
        includes(student_progresses: [:lesson, :lesson_part]).
        joins(:school_classes).
        where('school_classes.id in (?)', school_classes.map(&:id)).
        group('students.id')
  end
end
