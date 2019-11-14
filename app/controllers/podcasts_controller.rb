class PodcastsController < ApplicationController
  def index
    @podcast = Podcast.all
    @user = current_user
  end
end
