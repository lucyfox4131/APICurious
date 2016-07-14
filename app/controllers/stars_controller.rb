class StarsController < ApplicationController
  def index
    @stars = ServiceAccessor.new(current_user).starred
  end
end
