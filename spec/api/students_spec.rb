require 'airborne'
require 'rails_helper'

describe 'student spec' do
  let!(:lesson) { Lesson.first }
  let!(:student) { create(:student, school: lesson.school) }
  let!(:lesson_1_part_1) { lesson.sequenced_lesson_parts.first }
  let!(:last_lesson_part) { lesson.sequenced_lesson_parts.to_a.last }

  describe 'with progress' do
    before do
      student.complete_course!(lesson_1_part_1)
    end

    it 'should get student details' do
      get "/api/v1/students/#{student.id}"
      expect_status(200)
      completed_course = JSON.parse(response.body)['student_progresses']
      expect(completed_course.length).to eq 1
    end
  end
end