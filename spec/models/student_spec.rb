require 'rails_helper'

RSpec.describe Student, type: :model do
  let!(:lesson1) { Lesson.first }
  let!(:lesson2) { Lesson.all[1] }
  let!(:student) { create(:student, school: lesson1.school) }
  let!(:lesson_1_part_1) { LessonPart.first }
  let!(:last_lesson_part) { LessonPart.last }

  describe 'with existing progress' do
    before do
      student.complete_course!(lesson1.sequenced_lesson_parts[0])
      student.complete_course!(lesson1.sequenced_lesson_parts[1])
    end

    it 'should have one lesson' do
      expect(student.student_progresses.length).to eq 2
    end

    it 'should return current progress' do
      expect(student.current_progress.id).to eq lesson1.sequenced_lesson_parts[1].id
    end

    it 'should failed when duplicate progress' do
      expect{
        student.complete_course!(lesson1.sequenced_lesson_parts[0])
      }.to raise_error(Exceptions::InvalidCourse)
      expect{
        student.complete_course!(lesson1.sequenced_lesson_parts[1])
      }.to raise_error(Exceptions::InvalidCourse)
    end

    it 'should failed when create invalid progress' do
      expect{
        student.complete_course!(last_lesson_part)
      }.to raise_error(Exceptions::InvalidCourse)
    end

    it 'should complete the next part within same lesson' do
      expect(student.complete_course!(lesson1.sequenced_lesson_parts[2])).to be_an_instance_of(StudentProgress)
    end

    it 'should complete the next part for next lesson' do
      student.complete_course!(lesson1.sequenced_lesson_parts[2])
      expect(student.lesson_parts.reload.length).to eq 3
      expect(student.complete_course!(lesson2.sequenced_lesson_parts[0])).to be_an_instance_of(StudentProgress)
    end

    it 'should return the next valid lesson part' do
      expect(student.current_progress.next_item).to eq lesson_1_part_1.lesson.sequenced_lesson_parts[2].id
    end
  end

  describe 'without progress' do
    it 'should failed when duplicate progress' do
      expect(
        student.complete_course!(lesson1.sequenced_lesson_parts[0])
      ).to be_an_instance_of(StudentProgress)
    end
  end
end