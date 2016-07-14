class Followers < OpenStruct
  def self.all(service)
    service.followers.map { |follower| Followers.new(follower) }
  end
end
