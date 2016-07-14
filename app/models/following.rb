class Following < OpenStruct
  def self.all(service)
    service.following.each { |following| Following.new(following) }
  end
end
