class UsersController < ApplicationController
  def show
  end

  def data
    respond_to do |format|
      format.json {
        render :json => current_user.repos
      }
    end
  end
end
