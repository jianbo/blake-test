require 'rails_helper'

RSpec.describe Lesson, type: :model do
  let!(:lesson) { create(:lesson) }

  describe 'lesson with parts' do
    before do
      lesson.lesson_parts.create(name: 'part 1')
      lesson.lesson_parts.create(name: 'part 2')
      lesson.lesson_parts.create(name: 'part 3')
    end

    it 'should have 3 parts' do
      expect(lesson.lesson_parts.length).to eq 3
    end
  end
end