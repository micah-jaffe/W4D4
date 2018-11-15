class UsersController < ApplicationController
  def new
    render :new
  end
  
  def create
    user = User.new(user_params)
    
    if user.save
      flash[:user] = "Account created!"
      redirect_to user_url(user)
    else
      flash.now[:user] = "Invalid credentials"
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
    render :show
  end
  
  private
  
  def user_params
    params.require(:user).permit(
      email: params[:user][:email],
      password: params[:user][:password]
    )
  end
end
