class SessionsController < ApplicationController
  def new
    render :new
  end
  
  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    
    if user.nil?
      flash.now[:session] = "Could not find account"
      render :new
    else
      login!(user)
      redirect_to user_url(user)
    end
  end
  
  def destroy
  end
end