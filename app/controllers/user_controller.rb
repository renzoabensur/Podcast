class UserController < ApplicationController
    def index
    end

    def create
        if params[:commit] == "Login"
            @user = User.find_by(email:params[:email])
            if @user && @user.authenticate(params[:password_digest]) 
                sign_in(@user)
                redirect_to root_path and return
            else
                redirect_to fail_user_path and return
            end
        end
        
        if User.find_by(email:params[:email]).present?
            redirect_to fail_user_path and return
        else
            @user = User.new
            @user.name = params[:name]
            @user.email = params[:email]
            @user.password = params[:password_digest]
            @user.admin_user = false
            @user.save!
            # sign_in(@user)
            redirect_to root_path and return
        end
    end
    
    def fail
    end

    def logout
        sign_out
        redirect_to root_path and return
    end

    def profile
        @user = current_user
    end
end
  