class UsersController < ApplicationController
  def show
  end

  def repo_data
    respond_to do |format|
      format.json {
        render :json => current_user.repos
      }
    end
  end

  def follower_data
    respond_to do |format|
      format.json {
        render :json => current_user.followers
      }
    end
  end
end
