class AddSoundcloudUrlToWorks < ActiveRecord::Migration[5.1]
  def change
    add_column :works, :soundcloud_url, :string
    add_column :works, :soundcloud_in_top, :boolean, default: true
    add_column :works, :soundcloud_in_bottom, :boolean
  end
end
