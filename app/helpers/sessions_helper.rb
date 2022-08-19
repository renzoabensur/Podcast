module SessionsHelper
    def sign_in(user)
        session[:user_id] = user.id
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def no_favorite(podcastscrapping_id)
        Favorite.where(user_id:current_user.id, podcastscrapping_id:podcastscrapping_id).empty?
    end

    def can_desfavorite?(podcastscrapping_id)
        current_user && no_favorite(podcastscrapping_id)
    end

    def can_favorite?(podcastscrapping_id)
        current_user && no_favorite(podcastscrapping_id)
    end

    def block_access
        if current_user.present?
            redirect_to root_path
        end
    end

    def logged_in?
        !current_user.nil?
    end

    def sign_out
        session.delete(:user_id)
        @current_user = nil
    end
end