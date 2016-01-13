class ExploreController < ApplicationController
  def index
    @followers = User.followers(current_user.nickname)
  end
end
