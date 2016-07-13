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

  def followers
    UserService.new.followers(self)
  end

  def following
    UserService.new.following(self)
  end

  def starred
    UserService.new.starred(self)
  end

  def repos
    UserService.new.repositories(self)
  end

  def activity
    UserService.new.activities(self)
  end

  def events
    UserService.new.push_events(self)
  end

  def organizations
    UserService.new.orgs(self)
  end

  def following_events
    following.map do |person|
      UserService.new.other_user_events(person["login"])
    end
  end
end
