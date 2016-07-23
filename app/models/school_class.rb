class SchoolClass < ApplicationRecord
  has_many :school_class_students
  has_many :students, through: :school_class_students
end
