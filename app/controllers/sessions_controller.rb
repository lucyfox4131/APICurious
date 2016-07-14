class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to dashboard_path(user.nickname_slug)
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
