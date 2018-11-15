class UsersController < ApplicationController
  def new
    render :new
  end
  
  def create
    user = User.new(user_params)
    
    if user.save
      flash[:user] = "Account created!"
      login!(user)
      redirect_to user_url(user)
    else
      flash.now[:user] = "Invalid username or password"
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
    render :show
  end
  
  private
  
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
