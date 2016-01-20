class ReposController < ApplicationController
  def index
  end

  def show
  end

  def specific_repo_data
    render :json => Repo.specific_repo_data(params[:user_id], params[:id])
  end

  def commit_data
    render :json => Repo.commit_data(params[:user_id], params[:id])
  end

  def commit_activity
    render :json => Repo.commit_activity(params[:user_id], params[:id])
  end

  def language_data
    render :json => Repo.language_data(params[:user_id], params[:id])
  end

  def contributor_data
    render :json => Repo.contributor_data(params[:user_id], params[:id])
  end

  def code_frequency
    render :json => Repo.code_frequency(params[:user_id], params[:id])
  end
end
