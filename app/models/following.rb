class Following < OpenStruct
  def self.all(service)
    service.following.map { |following| Following.new(following) }
  end
end
