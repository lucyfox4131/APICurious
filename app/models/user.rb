class User < ActiveRecord::Base
  before_create :create_slug

  def create_slug
    self.nickname_slug = self.nickname.parameterize
  end

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                  = auth_info.uid
      new_user.name                 = auth_info.info.name
      new_user.nickname             = auth_info.info.nickname
      new_user.avatar               = auth_info.info.image
      new_user.oauth_token          = auth_info.credentials.token
    end
  end
end
