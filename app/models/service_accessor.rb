class ServiceAccessor
  attr_reader :user

  def initialize(current_user)
    @user = current_user
  end

  def service
    @service ||= UserService.new(user)
  end

  def followers
    Followers.all(service)
  end

  def following
    Following.all(service)
  end

  def starred
    Starred.all(service)
  end

  def repos
    Repos.all(service)
  end

  def organizations
    Organizations.all(service)
  end

  def events
    Events.all(service)
  end

  def following_events
    followers.map do |person|
      Events.all_for_following(service, person.login)
    end.flatten
  end
end
