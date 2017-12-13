class AddShareImageToWorks < ActiveRecord::Migration[5.1]
  def change
    add_column :works, :share_image, :string
  end
end
