class AddCoverImageToWorks < ActiveRecord::Migration[5.1]
  def change
    add_column :works, :cover_image, :string
  end
end
