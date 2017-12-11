class CreateSources < ActiveRecord::Migration[5.1]
  def change
    create_table :sources do |t|
      t.string :title
      t.text :description
      t.string :link
      t.string :image
      t.belongs_to :work, foreign_key: true

      t.timestamps
    end
  end
end
