class AddSchoolIdToSchoolClass < ActiveRecord::Migration[5.0]
  def change
    add_column :school_classes, :school_id, :integer
    add_index :school_classes, :school_id
  end
end
