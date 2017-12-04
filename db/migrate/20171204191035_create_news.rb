class CreateNews < ActiveRecord::Migration[5.1]
  def change
    create_table :news do |t|
      t.string :title
      t.string :type_of_thing
      t.datetime :date
      t.belongs_to :work

      t.timestamps
    end
  end
end
