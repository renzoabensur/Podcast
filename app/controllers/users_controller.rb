class UsersController < ApplicationController
    def index
    end

    def create
        if params[:commit] == "Login"
            valid_login(params[:email], params[:password_field])
            redirect_to root_path
        end

        User.create(name: params[:name], email:params[:email], password_digest: params[:password_field]) if validate_email(params[:email])
    end

    def show
    end

    private
    def valid_login(email, password)
        true if User.where(email:email).password_digest == password

        false
    end

    def validate_email(email)
        true if User.where(email:email).empty?

        false
    end
end
  