class CreateSchoolClassTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :school_class_teachers do |t|
      t.belongs_to :teacher, foreign_key: true
      t.belongs_to :school_class, foreign_key: true

      t.timestamps
    end
  end
end
