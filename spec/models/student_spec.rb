require 'rails_helper'

RSpec.describe Student, type: :model do
  let!(:student) { create(:student) }
  let!(:lesson1) { Lesson.first }

  before do
    student.student_progresses.create!(lesson_part: lesson1.lesson_parts[0], lesson: lesson1)
    student.student_progresses.create!(lesson_part: lesson1.lesson_parts[1], lesson: lesson1)
  end

  it 'should have one lesson' do
    expect(student.student_progresses.length).to eq 2
  end
end