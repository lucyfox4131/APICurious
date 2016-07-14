class Repos < OpenStruct
  def self.all(service)
    service.repositories.each { |repo| Repos.new(repo) }
  end
end
