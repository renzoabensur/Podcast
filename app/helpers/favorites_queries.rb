module FavoritesQueries
    def favorite(podcastscrapping_id)
        Favorite.where(user_id:current_user.id, podcastscrapping_id:podcastscrapping_id).empty?
    end
end