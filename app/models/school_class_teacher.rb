# encoding: utf-8
#
class SchoolClassTeacher < ApplicationRecord
  belongs_to :teacher
  belongs_to :school_class
end
