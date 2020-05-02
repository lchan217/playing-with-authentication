class PodcastsController < ApplicationController
  def index
    @user = current_user
    @podcasts = current_user.podcasts
  end

  def new
    @podcast = Podcast.new
    @user = current_user
  end

  def create
    @podcast = Podcast.create(podcast_params)
    redirect_to all_path
  end 

  private
  def podcast_params
    params.require(:podcast).permit(:name, :host, :category, :user_id)
  end 
end
