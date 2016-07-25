# encoding: utf-8
#
class Lesson < ApplicationRecord
  include Sequenceable

  has_many :sequences, as: :sequenceable
  has_many :lesson_parts


  # place holder to persist lessons per school
  belongs_to :school
  sequenceable :school

  validates :school, presence: true

  def sequenced_lesson_parts
    raise 'Missing required sequence' unless sequences.first
    lesson_parts.order("position(id::text in '#{sequences.first.sequence_ids}')")
  end
end
