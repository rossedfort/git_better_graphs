class SessionsController < ApplicationController
  def create
    if user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
    end
    flash[:notice] = "Welcome, #{user.nickname}"
    redirect_to user_path(user.id)
  end

  def destroy
    session.clear
    flash[:notice] = "Goodbye!"
    redirect_to root_url
  end
end
