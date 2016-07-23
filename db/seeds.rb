# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

lesson1 = Lesson.create(name: 'Lesson 1')
lesson1.lesson_parts.create!(name: 'Lesson 1 part 1')
lesson1.lesson_parts.create!(name: 'Lesson 1 part 2')
lesson1.lesson_parts.create!(name: 'Lesson 1 part 3')

lesson2 = Lesson.create(name: 'Lesson 2')
lesson2.lesson_parts.create!(name: 'Lesson 2 part 1')
lesson2.lesson_parts.create!(name: 'Lesson 2 part 2')
lesson2.lesson_parts.create!(name: 'Lesson 2 part 3')

lesson3 = Lesson.create(name: 'Lesson 3')
lesson3.lesson_parts.create!(name: 'Lesson 3 part 1')
lesson3.lesson_parts.create!(name: 'Lesson 3 part 2')
lesson3.lesson_parts.create!(name: 'Lesson 3 part 3')

lesson4 = Lesson.create(name: 'Lesson 4')
lesson4.lesson_parts.create!(name: 'Lesson 4 part 1')
lesson4.lesson_parts.create!(name: 'Lesson 5 part 2')
lesson4.lesson_parts.create!(name: 'Lesson 6 part 3')