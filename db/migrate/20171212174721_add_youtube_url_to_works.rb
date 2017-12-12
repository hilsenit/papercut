class AddYoutubeUrlToWorks < ActiveRecord::Migration[5.1]
  def change
    add_column :works, :youtube_url, :string
    add_column :works, :youtube_in_top, :boolean, default: true
    add_column :works, :youtube_in_bottom, :boolean
  end
end
