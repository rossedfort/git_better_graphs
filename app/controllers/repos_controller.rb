class ReposController < ApplicationController
  def index
  end

  def show
  end

  def specific_repo_data
    respond_to do |format|
      format.json {
        render :json => Repo.specific_repo_data(params[:user_id], params[:id])
      }
    end
  end

  def commit_data
    respond_to do |format|
      format.json {
        render :json => Repo.commit_data(params[:user_id], params[:id])
      }
    end
  end

  def commit_activity
    respond_to do |format|
      format.json {
        render :json => Repo.commit_activity(params[:user_id], params[:id])
      }
    end
  end

  def language_data
    data = Repo.language_data(params[:user_id], params[:id])
    formatted_data = data.map do |name, size|
      {"label" => name, "value" => size}
    end
    render json: formatted_data
  end

  def contributor_data
    respond_to do |format|
      format.json {
        render :json => Repo.contributor_data(params[:user_id], params[:id])
      }
    end
  end

  def code_frequency
    respond_to do |format|
      format.json {
        render :json => Repo.code_frequency(params[:user_id], params[:id])
      }
    end
  end
end
