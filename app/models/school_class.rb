# encoding: utf-8
#
class SchoolClass < ApplicationRecord
  has_many :school_class_students
  has_many :students, through: :school_class_students

  has_many :school_class_teachers
  has_many :teachers, through: :school_class_teachers

  belongs_to :school

  validates :school, presence: true
end
