class ExploreController < ApplicationController
  def index
    @followers = User.followers(current_user.nickname)
    @following = User.following(current_user.nickname)
  end

  def search
    if params[:id] == ""      
      flash[:error] = "Please submit search parameters"
      redirect_to :back
    else
      @results = User.search(params[:id])
    end
  end
end
