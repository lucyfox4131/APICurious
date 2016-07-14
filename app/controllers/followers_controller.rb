class FollowersController < ApplicationController
  def index
    @followers = ServiceAccessor.new(current_user).followers
  end
end
