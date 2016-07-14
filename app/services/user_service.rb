class UserService

  def initialize(user)
    @_connection = Faraday.new("https://api.github.com")
    @_user = user
    @_connection.headers["Authorization"] = "Token #{user.oauth_token}"
  end

  def followers
    response = connection.get('/user/followers')
    parse(response)
  end

  def following
    response = connection.get('/user/following')
    parse(response)
  end

  def starred
    response = connection.get('/user/starred')
    parse(response)
  end

  def repositories
    response = connection.get('/user/repos')
    parse(response)
  end

  def push_events
    response = connection.get("/users/#{user.nickname}/events")
    parse(response)
  end

  def other_user_events
    response = connection.get("/users/#{username}/events")
    parse(response)
  end

  def orgs(user)
    connection.headers["Authorization"] = "Token #{user.oauth_token}"
    response = connection.get("/users/#{user.nickname}/orgs")
    parse(response)
  end

  def parse(response)
    JSON.parse(response.body)
  end

  private

    def connection
      @_connection
    end

    def user
      @_user
    end
end
