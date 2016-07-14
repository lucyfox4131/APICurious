class Events < OpenStruct

  def self.all(service)
    service.push_events.map do |event|
      Events.new(event) if event["type"].include?("Push")
    end.compact
  end

  def self.all_for_following(service, username)
    service.other_user_events(username).map do |event|
      Events.new(event) if event["type"].include?("Push")
    end.compact
  end

  def username
    self.actor["login"]
  end

  def repo_name
    self.repo["name"]
  end

  def repo_url
    self.repo["url"]
  end

  def commit_message
    self.payload["commits"][0]["message"]
  end

  def author_name
    self.payload["commits"][0]["author"]["name"]
  end

  def formatted_time
    t = Time.parse(self.created_at)
    t.strftime("%m/%d/%Y at %I:%M%p")
  end

  def event_description
    "Commit of '#{commit_message}' by #{username} on #{formatted_time} for #{repo_name} repo."
  end
end
