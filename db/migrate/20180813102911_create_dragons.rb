class CreateDragons < ActiveRecord::Migration[5.2]
  def change
    create_table :dragons do |t|
      t.string :name
      t.string :color
      t.integer :size
      t.text :diet
      t.integer :temperament, default: 2
      t.boolean :fire
      t.string :location
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
