class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        if @user.nil?
            flash[:notice] = "User not found"
            redirect_to login_url
        else
            if @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                flash[:notice] = "Log in successful"
                redirect_to root_url
            else
                flash[:notice] = "Authentication failed"
                redirect_to login_url
            end
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_url
    end

end