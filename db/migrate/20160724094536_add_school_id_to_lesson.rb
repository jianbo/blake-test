class AddSchoolIdToLesson < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :school_id, :integer
    add_index :lessons, :school_id
  end
end
