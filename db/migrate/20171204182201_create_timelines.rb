class CreateTimelines < ActiveRecord::Migration[5.1]
  def change
    create_table :news do |t|
      t.string :title
      t.datetime :date
      t.belongs_to :work

      t.timestamps
    end
  end
end
