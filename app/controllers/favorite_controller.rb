class FavoriteController < ApplicationController
    def index
    end

    def create
        redirect_to favorite_fail_path and return if Favorite.where(user_id:current_user.id, podcastscrapping_id:params[:podcastscrapping_id]).present?
        Favorite.create(user_id:current_user.id, podcastscrapping_id:params[:podcastscrapping_id])
        redirect_to root_path and return
    end

    def destroy
        Favorite.where(user_id:current_user.id, podcastscrapping_id:params[:podcastscrapping_id]).first.destroy
        redirect_to user_profile_path and return
    end
end
  