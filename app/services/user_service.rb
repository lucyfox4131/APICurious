class UserService

  def initialize(user)
    @_user = user
    @_connection = Faraday.new("https://api.github.com")
    @_connection.headers["Authorization"] = "Token #{user.oauth_token}"
  end

  def followers
    parse(connection.get('/user/followers'))
  end

  def following
    parse(connection.get('/user/following'))
  end

  def starred
    parse(connection.get('/user/starred'))
  end

  def repositories
    parse(connection.get('/user/repos'))
  end

  def push_events
    parse(connection.get("/users/#{user.nickname}/events"))
  end

  def other_user_events(username)
    parse(connection.get("/users/#{username}/events"))
  end

  def orgs
    parse(connection.get("/users/#{user.nickname}/orgs"))
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
