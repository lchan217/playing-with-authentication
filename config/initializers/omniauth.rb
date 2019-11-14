opts = { scope: 'user:email' }

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], opts
  provider :google_oauth2, "GOOGLE_CLIENT_ID", "GOOGLE_CLIENT_SECRET"
end
