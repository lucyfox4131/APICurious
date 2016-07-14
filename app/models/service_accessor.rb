class ServiceAccessor

  def initialize(current_user)
    @_user = current_user
  end

  def service
    UserService.new(user)
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

  def events
    Events.all(service)
  end

  def filtered_individual_events
    events.map do |event|
      PersonalEvent.new(event) if event["type"].include?("Push")
    end.compact
  end

  def organizations
    Organizations.all
    UserService.new.orgs(self)
  end

  def following_events
    following.map do |person|
      UserService.new.other_user_events(person["login"])
    end.flatten
  end

  def filtered_following_events
    following_events.map do |event|
      PersonalEvent.new(event) if event["type"].include?("Push")
    end.compact
  end

private

  def user
    @_user
  end
end
