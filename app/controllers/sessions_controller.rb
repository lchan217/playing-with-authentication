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
end
