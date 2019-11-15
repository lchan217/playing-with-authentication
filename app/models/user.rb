class User < ApplicationRecord
  has_many :podcasts
  has_secure_password

  validates :username, presence: true
  validates :username, uniqueness: true

  def self.from_github_omniauth(auth)
   where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
     user.email = auth.info.email
     user.uid = auth.uid
     user.provider = auth.provider
     user.avatar_url = auth.info.image
     user.username = auth.info.name
     user.oauth_token = auth.credentials.token
     user.password = SecureRandom.hex
   end
  end

  def self.from_google_omniauth(auth)
    where(provider: auth.provider, email: auth.info.email).first_or_initialize do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.username = auth.info.name
      user.password = SecureRandom.hex
    end
  end

  def self.from_twitter_hash(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
      user.name = auth.info.nickname
      user.profile_image = auth.info.image
      user.token = auth.credentials.token
      user.secret = auth.credentials.secret
      user.username = auth.info.name
      user.password = SecureRandom.hex
    end
  end
end
