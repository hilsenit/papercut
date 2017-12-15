class AddCreditsToWorks < ActiveRecord::Migration[5.1]
  def change
    add_column :works, :credits, :string, array: true, default: []
  end
end
