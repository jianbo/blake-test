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
end
