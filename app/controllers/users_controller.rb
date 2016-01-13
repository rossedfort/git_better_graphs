class UsersController < ApplicationController
  def show
  end

  def repo_data
    respond_to do |format|
      format.json {
        render :json => User.repos(params[:id])
      }
    end
  end

  def follower_data
    respond_to do |format|
      format.json {
        render :json => User.followers(params[:id])
      }
    end
  end

  def user_data
    respond_to do |format|
      format.json {
        render :json => User.data(params[:id])
      }
    end
  end
end
