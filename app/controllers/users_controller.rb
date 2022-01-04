class UsersController < ApplicationController
  skip_before_action :ensure_logged_in
  
  def index
    
    @users=User.all
  end

  def show
    @user=User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    #@user.role="student"
    if @user.save 
      #session[:user_id] = @user.id
      
      UserMailer.signup_confirmation(@user).deliver_now
      
      redirect_to bookslists_path
    else  
      render('new')
    end
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    
    if @user.update(user_params)
      redirect_to users_path 
    else  
      render 'edit'
    end
  end

  def delete
    @user=User.find(params[:id])
  end

  def destroy
    @user=User.find(params[:id])
    if @user.destroy 
      respond_to do |format|
        format.html { redirect_to users_path }
        format.json { head :no_content }
      end
      
    else  
      render('new')
    end
  end
  private 
  def user_params
    params.require(:user).permit(:name, :email, :password, :role)
  end
end
