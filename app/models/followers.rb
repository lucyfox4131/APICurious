class Followers < OpenStruct
  def self.all(service)
    service.followers.each { |follower| Followers.new(follower) }
  end
end
