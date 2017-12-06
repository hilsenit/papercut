class AddCreatedByToWorks < ActiveRecord::Migration[5.1]
  def change
    add_column :works, :created_by, :string
    add_column :works, :photo_by, :string
  end
end
