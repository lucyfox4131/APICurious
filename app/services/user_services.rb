class UserServices

  def initialize
    @_connection = Faraday.new("https://api.github.com")
  end

  def followers(user)
    connection.headers["Authorization"] = "Token #{user.oauth_token}"
    response = connection.get('/user/followers')
    parse(response)
  end

  def following(user)
    connection.headers["Authorization"] = "Token #{user.oauth_token}"
    response = connection.get('/user/following')
    parse(response)
  end

  def starred(user)
    connection.headers["Authorization"] = "Token #{user.oauth_token}"
    response = connection.get('/user/starred')
    parse(response)
  end

  def repositories(user)
    connection.headers["Authorization"] = "Token #{user.oauth_token}"
    response = connection.get('/user/repos')
    parse(response)
  end

  def activities(user)
    connection.headers["Authorization"] = "Token #{user.oauth_token}"
    response = connection.get('/feeds')
    parse(response)
  end

  def push_events(user)
    connection.headers["Authorization"] = "Token #{user.oauth_token}"
    response = connection.get("/users/#{user.nickname}/events")
    parse(response)
  end

  def orgs(user)
    connection.headers["Authorization"] = "Token #{user.oauth_token}"
    response = connection.get("/user/orgs")
    parse(response)
  end

  def parse(response)
    JSON.parse(response.body)
  end

  private
  def connection
    @_connection
  end
end
