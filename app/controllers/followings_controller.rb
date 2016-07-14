class FollowingsController < ApplicationController
  def index
    @following = ServiceAccessor.new(current_user).following
  end
end
