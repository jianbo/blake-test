desc "Generate 100 lessons"
task generate_lessons: :environment  do
  school = School.create!(name: 'First school')
  students = []
  teacher = Teacher.create(name: 'First teacher')
  school_class1 = SchoolClass.create!(name: 'Class 1', school: school)
  teacher.school_classes << school_class1

  1.upto(50) do |n|
    p "create student #{n}"
    student = Student.create!(name: "Generated student #{n}", school: school)
    students << student
    school_class1.students << student
  end

  lessons = []
  1.upto(100) do |n|
    p "create lesson #{n}"
    school = School.first
    lesson = Lesson.create!(name: "name #{n}", school: school)
    lessons << lesson
    1.upto(3) do |part_count|
      p "create lesson part #{part_count}"
      lesson.lesson_parts.create!(name: "Part #{part_count}")
    end
    lesson.sequences.create!(sequence_type: LessonPart.to_s, sequence_ids: lesson.lesson_parts.map(&:id))
  end

  school.sequences.create!(sequence_type: Lesson.to_s, sequence_ids: lessons.map(&:id))

  school.sequenced_lessons.each do |lesson|
    students[0..1].each do |student|
      lesson.sequenced_lesson_parts.each do |part|
        p "complete lesson #{part.name}"
        student.complete_course!(part)
      end
    end
  end
end

task add_more_lesson_parts: :environment  do
  Lesson.all.limit(50).each do |lesson|
    lesson.lesson_parts.create!(name: "Part 4")
    lesson.lesson_parts.create!(name: "Part 5")
  end
end