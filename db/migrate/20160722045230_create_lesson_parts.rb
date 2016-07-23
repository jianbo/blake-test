class CreateLessonParts < ActiveRecord::Migration[5.0]
  def change
    create_table :lesson_parts do |t|
      t.string :name
      t.belongs_to :lesson, foreign_key: true

      t.timestamps
    end
  end
end
