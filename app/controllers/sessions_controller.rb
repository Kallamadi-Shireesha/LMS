class SessionsController < ApplicationController
    skip_before_action :ensure_logged_in

    def new
    end
  
    def create
      user = User.find_by(email: params[:email])
      if user 
        session[:user_id] = user.id
        session[:user_role] = user.role
      
        flash[:success] = "Succesfully Logged-In"
        redirect_to bookslists_path
      else
        flash[:error] = "Invalid Login Attemp Please Retry"
        redirect_to new_session_path
      end
    end
  
    # ? Destroying the Session
    def destroy
      
      session[:user_id] = nil
      session[:user_role] = nil
      session[:requested_book]=nil
      @current_user = nil
      redirect_to "/"
    end
end
