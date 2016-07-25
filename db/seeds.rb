# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
#
# school = School.create!(name: 'First school')
#
# lesson1 = Lesson.create(name: 'Lesson 1', school: school)
# lesson1.lesson_parts.create!(name: 'Lesson 1 part 1')
# lesson1.lesson_parts.create!(name: 'Lesson 1 part 2')
# lesson1.lesson_parts.create!(name: 'Lesson 1 part 3')
# lesson1.sequences.create!(sequence_type: LessonPart.to_s, sequence_ids: [lesson1.lesson_parts[1].id, lesson1.lesson_parts[2].id, lesson1.lesson_parts[0].id])
#
# lesson2 = Lesson.create(name: 'Lesson 2', school: school)
# lesson2.lesson_parts.create!(name: 'Lesson 2 part 1')
# lesson2.lesson_parts.create!(name: 'Lesson 2 part 2')
# lesson2.lesson_parts.create!(name: 'Lesson 2 part 3')
# lesson2.sequences.create!(sequence_type: LessonPart.to_s, sequence_ids: lesson2.lesson_parts.map(&:id).reverse)
#
# lesson3 = Lesson.create(name: 'Lesson 3', school: school)
# lesson3.lesson_parts.create!(name: 'Lesson 3 part 1')
# lesson3.lesson_parts.create!(name: 'Lesson 3 part 2')
# lesson3.lesson_parts.create!(name: 'Lesson 3 part 3')
# lesson3.sequences.create!(sequence_type: LessonPart.to_s, sequence_ids: lesson3.lesson_parts.map(&:id).reverse)
#
# lesson4 = Lesson.create(name: 'Lesson 4', school: school)
# lesson4.lesson_parts.create!(name: 'Lesson 4 part 1')
# lesson4.lesson_parts.create!(name: 'Lesson 5 part 2')
# lesson4.lesson_parts.create!(name: 'Lesson 6 part 3')
# lesson4.sequences.create!(sequence_type: LessonPart.to_s, sequence_ids: lesson4.lesson_parts.map(&:id).reverse)
# school.sequences.create!(sequence_type: Lesson.to_s, sequence_ids: Lesson.all.map(&:id))
#
# # with 2 classes and 6 students 3 in each class
# teacher = Teacher.create(name: 'First teacher')
#
# school_class1 = SchoolClass.create!(name: 'Class 1', school: school)
# school_class2 = SchoolClass.create!(name: 'Class 2', school: school)
# teacher.school_classes << school_class1
# teacher.school_classes << school_class2
#
# student1 = Student.create!(name: 'Student 1', school: school)
# student1.complete_course!(lesson1.sequenced_lesson_parts[0])
# student1.complete_course!(lesson1.sequenced_lesson_parts[1])
# student1.complete_course!(lesson1.sequenced_lesson_parts[2])
#
# student2 = Student.create!(name: 'Student 2', school: school)
# student2.complete_course!(lesson1.sequenced_lesson_parts[0])
# student2.complete_course!(lesson1.sequenced_lesson_parts[1])
# student2.complete_course!(lesson1.sequenced_lesson_parts[2])
# student2.complete_course!(lesson2.sequenced_lesson_parts[0])
# student2.complete_course!(lesson2.sequenced_lesson_parts[1])
# student2.complete_course!(lesson2.sequenced_lesson_parts[2])
#
# student3 = Student.create(name: 'Student 3', school: school)
# student3.complete_course!(lesson1.sequenced_lesson_parts[0])
# student3.complete_course!(lesson1.sequenced_lesson_parts[1])
# student3.complete_course!(lesson1.sequenced_lesson_parts[2])
# student3.complete_course!(lesson2.sequenced_lesson_parts[0])
# student3.complete_course!(lesson2.sequenced_lesson_parts[1])
# student3.complete_course!(lesson2.sequenced_lesson_parts[2])
# student3.complete_course!(lesson3.sequenced_lesson_parts[0])
# student3.complete_course!(lesson3.sequenced_lesson_parts[1])
#
#
# school_class1.students << student1
# school_class1.students << student2
# school_class1.students << student3
#
# student4 = Student.create!(name: 'Student 4', school: school)
# student4.complete_course!(lesson1.sequenced_lesson_parts[0])
# student4.complete_course!(lesson1.sequenced_lesson_parts[1])
#
#
# student5 = Student.create!(name: 'Student 5', school: school)
# student5.complete_course!(lesson1.sequenced_lesson_parts[0])
# student5.complete_course!(lesson1.sequenced_lesson_parts[1])
# student5.complete_course!(lesson1.sequenced_lesson_parts[2])
# student5.complete_course!(lesson2.sequenced_lesson_parts[0])
# student5.complete_course!(lesson2.sequenced_lesson_parts[1])
# student5.complete_course!(lesson2.sequenced_lesson_parts[2])
# student5.complete_course!(lesson3.sequenced_lesson_parts[0])
# student5.complete_course!(lesson3.sequenced_lesson_parts[1])
#
#
# student6 = Student.create!(name: 'Student 6', school: school)
# school_class2.students << student4
# school_class2.students << student5
# school_class2.students << student6
# school_class2.students << student3
#
#
