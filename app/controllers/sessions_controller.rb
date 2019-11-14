class SessionsController < ApplicationController
  def github_create
    if auth_hash = request.env["omniauth.auth"]
      @user = User.from_github_omniauth(auth_hash)
      session[:user_id] = @user.id
      redirect_to podcasts_path
    else
      redirect_to root_path
    end
  end

  def google_create
    if access_token = request.env["omniauth.auth"]
      user = User.from_google_omniauth(access_token)
      user.google_token = access_token.credentials.token
      refresh_token = access_token.credentials.refresh_token
      user.google_refresh_token = refresh_token if refresh_token.present?
      user.save
      redirect_to podcasts_path
    else
      redirect_to root_path
    end
  end

  def twitter_create
    if auth_hash = request.env["omniauth.auth"]
      @user = User.from_twitter_hash(auth_hash)
      session[:user_id] = @user.id
      redirect_to podcasts_path
    else
      redirect_to root_path
    end
  end
end
