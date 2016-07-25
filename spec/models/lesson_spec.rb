require 'rails_helper'

RSpec.describe Lesson, type: :model do
  let!(:lesson1) { create(:lesson) }
  let!(:lesson2) { create(:lesson) }
  let!(:lesson3) { create(:lesson) }
  let!(:lesson4) { create(:lesson) }
  let!(:lesson5) { create(:lesson) }

  describe 'lesson with parts' do
    before do
      lesson1.lesson_parts.create(name: 'part 1')
      lesson1.lesson_parts.create(name: 'part 2')
      lesson1.lesson_parts.create(name: 'part 3')
    end

    it 'should have 3 parts' do
      expect(lesson1.lesson_parts.length).to eq 3
    end

    it 'should return sequenced parts' do
      lesson = Lesson.first
      expect(lesson.sequenced_lesson_parts.map(&:id)).to eq lesson.sequences.first.sequence_ids
    end

    it 'should return next lesson' do
      # Sequence.create!(identifier: Lesson.identifier,
      #                  sequence_ids: [lesson1, lesson2, lesson3, lesson4, lesson5].map(&:id),
      #                  sequence_type: Lesson.to_s,
      #                  sequenceable: nil)
      # expect(lesson1.next_item).to eq lesson2
      #
      #
      # Sequence.create!(identifier: Lesson.identifier,
      #                  sequence_ids: [lesson5, lesson4, lesson3, lesson2, lesson1].map(&:id),
      #                  sequence_type: Lesson.to_s,
      #                  sequenceable: nil)
      # expect(lesson5.next_item).to eq lesson4
      # expect(lesson4.next_item).to eq lesson3
      # expect(lesson3.next_item).to eq lesson2
      # expect(lesson2.next_item).to eq lesson1
    end
  end
end