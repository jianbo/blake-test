class AddLessonPartIdToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :lesson_part_id, :integer
    add_index :students, :lesson_part_id
  end
end
