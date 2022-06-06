class CreatePodcastLists < ActiveRecord::Migration[7.0]
  def change
    create_table :podcast_lists do |t|
      t.string :title

      t.timestamps
    end
  end
end
