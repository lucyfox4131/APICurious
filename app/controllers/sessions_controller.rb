class SessionsController < ApplicationController
  def create
    # render text: request.env["omniauth.auth"].inspect --> info is just info=#
    if user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
    end
    redirect_to root_path
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
