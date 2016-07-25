# encoding: utf-8
#
class School < ApplicationRecord
  has_many :sequences, as: :sequenceable
  has_many :lessons

  def sequenced_lessons
    lessons.order("position(id::text in '#{sequences.first.sequence_ids}')")
  end
end
