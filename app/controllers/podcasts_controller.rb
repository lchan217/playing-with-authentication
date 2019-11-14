class PodcastsController < ApplicationController
  def index
    @user = current_user
    @podcasts = current_user.podcasts
  end
end
