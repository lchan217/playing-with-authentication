class PodcastsController < ApplicationController
  def index
    @user = current_user
    @podcasts = current_user.podcasts
  end

  def new
    @podcast = Podcast.new
    @user = current_user
  end
end
