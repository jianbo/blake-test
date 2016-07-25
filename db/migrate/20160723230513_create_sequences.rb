class CreateSequences < ActiveRecord::Migration[5.0]
  def change
    create_table :sequences do |t|
      t.string :sequenceable_type
      t.integer :sequenceable_id
      t.integer :sequence_ids, array: true
      t.string :sequence_type

      t.timestamps
    end
    add_index :sequences, :sequence_ids, using: 'gin'
    add_index :sequences, :sequenceable_id
    add_index :sequences, :sequenceable_type
  end
end
