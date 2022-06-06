class AddImageUrlToPodcastscrapping < ActiveRecord::Migration[7.0]
  def change
    add_column :podcastscrappings, :image_url, :string
  end
end
