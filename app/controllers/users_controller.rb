class UsersController < ApplicationController

    def new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            flash[:notice] = "Sign up success"
            session[:user_id] = @user.id
            redirect_to root_path
        else
            flash[:notice] = "Sign up failed"
            redirect_to new_user_path
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

end
