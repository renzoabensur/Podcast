class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :podcastscrapping, index: true, foreign_key: true

      t.timestamps
    end
  end
end
