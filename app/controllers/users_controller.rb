class UsersController < ApplicationController
  def show
    @user = User.find_by(nickname_slug: params[:nickname_slug])
  end
end
