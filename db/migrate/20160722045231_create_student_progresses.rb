class CreateStudentProgresses < ActiveRecord::Migration[5.0]
  def change
    create_table :student_progresses do |t|
      t.belongs_to :student, foreign_key: true
      t.belongs_to :lesson_part, foreign_key: true
      t.belongs_to :lesson, foreign_key: true

      t.timestamps
    end
  end
end
