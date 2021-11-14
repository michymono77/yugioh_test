class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :image_url
      t.string :desc
      t.string :type
      t.string :race
      t.string :archetype
      t.string :amazon_price

      t.timestamps
    end
  end
end
