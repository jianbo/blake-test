FactoryGirl.define do
  factory :lesson_part do
    sequence :name do |n|
      "Lesson part #{n}"
    end
    lesson
  end
end
