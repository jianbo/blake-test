require 'rails_helper'

RSpec.describe Teacher, type: :model do
  let!(:teacher) { Teacher.first }

  it 'should have two lesson' do
    expect(teacher.school_classes.length).to eq 2
  end

  it 'return all students in teacher\'s classes' do
    students = teacher.all_students
    expect(students.length).to eq 6
    expect(students.first.student_progresses.length).to eq 0
    students.first.complete_course!(Lesson.first.sequenced_lesson_parts.first)
    expect(students.first.student_progresses.length).to eq 1
  end
end