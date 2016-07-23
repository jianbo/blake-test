class CreateSchoolClassStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :school_class_students do |t|
      t.belongs_to :student, foreign_key: true
      t.belongs_to :school_class, foreign_key: true

      t.timestamps
    end
  end
end
