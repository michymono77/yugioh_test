class CreateStructures < ActiveRecord::Migration[6.0]
  def change
    create_table :structures do |t|
      t.references :card, null: false, foreign_key: true
      t.references :deck, null: false, foreign_key: true

      t.timestamps
    end
  end
end
