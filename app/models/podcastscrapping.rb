class Podcastscrapping < ApplicationRecord
    has_many :favorites, dependent: :destroy
end
