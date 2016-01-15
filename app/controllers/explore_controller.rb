class ExploreController < ApplicationController
  def index
    @followers = User.followers(current_user.nickname)
    @following = User.following(current_user.nickname)
  end

  def search
    @results = User.search(params[:id])
  end
end
