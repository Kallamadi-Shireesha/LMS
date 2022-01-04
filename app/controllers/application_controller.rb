class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  before_action :ensure_logged_in
  

  
  def ensure_logged_in
    # ? halt that request cycle
    unless current_user
      redirect_to users_path
    end
  end

  def ensure_owner
    # ? Route to Owners
    unless @current_user.role == "owner"
      redirect_to users_path
    end
  end

  

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
end


end
