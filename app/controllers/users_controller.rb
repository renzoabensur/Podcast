class UsersController < ApplicationController
    def create
        @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user_id
            redirect_to user_path(@user)
        else
            redirect_to new_session_path
        end
    end
end
  