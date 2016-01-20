class UsersController < ApplicationController
  def show
  end

  def repo_data
    render :json => User.repo_data(params[:id])
  end

  def follower_data
    render :json => User.followers(params[:id])
  end

  def user_data
    render :json => User.data(params[:id])
  end
end
