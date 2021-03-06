class SessionsController < ApplicationController
  def new
    redirect_to subs_url if logged_in?
  end

  def create
    user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if user
      login!(user)
      redirect_to subs_url
    else
      flash.now[:errors] = ['Invalid Username and/or Password']
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end
  
end
