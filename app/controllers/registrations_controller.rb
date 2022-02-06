class RegistrationsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(userParams)
        if @user.save
            session[:user_id] = @user_id
            flash[:success] = "Successfully created account"
            redirect_to sign_in_path
        else
            flash[:error] = "Something went wrong"
            redirect_to sign_up_path
        end
    end

    private

    def userParams
        params.require(:user).permit(:user_name, :gender, :password, :password_confirmation)
    end
end