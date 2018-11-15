class UsersController < ApplicationController
  
  def new
    render :new
  end
  
  def create
    user = User.new(
      email: params[:user][:email],
      password: params[:user][:password]
    )
    
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
end
