class AddShareDescriptionToWorks < ActiveRecord::Migration[5.1]
  def change
    add_column :works, :share_description, :text
  end
end
