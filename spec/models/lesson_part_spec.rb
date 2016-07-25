require 'airborne'
require 'rails_helper'

RSpec.describe LessonPart do

  describe 'test sequences' do
    let!(:lesson) { create(:lesson) }
    let!(:part1) { create(:lesson_part, lesson: lesson) }
    let!(:part2) { create(:lesson_part, lesson: lesson) }
    let!(:part3) { create(:lesson_part, lesson: lesson) }
    let!(:part4) { create(:lesson_part, lesson: lesson) }

    it 'return next item' do
      expect(part1.next_item).to be_nil
    end

    it 'should return next part' do
      lesson.sequences.create!(sequence_type: LessonPart.to_s, sequence_ids: [part1, part2, part3, part4].map(&:id))
      expect(part1.next_item).to eq part2.id
      expect(part2.next_item).to eq part3.id
      expect(part3.next_item).to eq part4.id
      expect(part4.next_item).to eq nil
    end
  end
end