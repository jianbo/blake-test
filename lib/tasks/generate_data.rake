desc "Generate 100 lessons"
task generate_lessons do
  1.upto(100) do |n|
    school = School.first
    lesson = Lesson.create!(name: "name #{n}", school: school)
    1.upto(3) do |part_count|
      lesson.lesson_parts.create!(name: "Part #{part_count}")
    end
  end
end

task add_more_lesson_parts do
  Lesson.all.limit(50).each do |lesson|
    lesson.lesson_parts.create!(name: "Part 4")
    lesson.lesson_parts.create!(name: "Part 5")
  end
end