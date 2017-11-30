class CreateThemes < ActiveRecord::Migration[5.1]
  def change
    create_table :themes do |t|
      t.string :title
      t.string :cover_image
      t.text :description
      t.text :made_by

      t.timestamps
    end
  end
end
