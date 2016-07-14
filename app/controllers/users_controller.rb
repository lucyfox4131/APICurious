class UsersController < ApplicationController
  def show
    if current_user
      @git_accessor = ServiceAccessor.new(current_user)
    else
      flash[:notice] = "You must be logged in to view this page"
      redirect_to root_path
    end
  end
end
