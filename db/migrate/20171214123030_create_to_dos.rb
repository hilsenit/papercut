class CreateToDos < ActiveRecord::Migration[5.1]
  def change
    create_table :to_dos do |t|
      t.string :title
      t.text :description
      t.string :image
      t.string :link
      t.references :work, foreign_key: true

      t.timestamps
    end
  end
end
