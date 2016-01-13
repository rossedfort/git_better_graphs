class ReposController < ApplicationController
  def index
  end

  def show
  end

  def specific_repo_data
    respond_to do |format|
      format.json {
        render :json => User.specific_repo_data(params[:user_id], params[:id])
      }
    end
  end

  def commit_data
    respond_to do |format|
      format.json {
        render :json => User.commit_data(params[:user_id], params[:id])
      }
    end
  end

  def language_data
    data = User.language_data(params[:user_id], params[:id])
    formatted_data = data.map do |name, size|
      {"label" => name, "value" => size}
    end
    render json: formatted_data
  end
end
