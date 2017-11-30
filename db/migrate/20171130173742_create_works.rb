class CreateWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :works do |t|
      t.string :title
      t.text :description
      t.text :short_description
      t.integer :category
      t.belongs_to :theme
      t.string :type

      t.timestamps
    end
  end
end
