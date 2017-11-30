class CreateWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :works do |t|
      t.string :title
      t.text :description
      t.text :short_description
      t.integer :category, default: 0
      t.belongs_to :theme
      t.string :type_of_content

      t.timestamps
    end
  end
end
