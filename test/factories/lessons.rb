FactoryGirl.define do
  factory :lesson do
    sequence :name do |n|
      "Lesson 1#{n}"
    end
    school
  end

end
