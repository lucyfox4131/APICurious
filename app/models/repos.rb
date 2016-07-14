class Repos < OpenStruct
  def self.all(service)
    service.repositories.map { |repo| Repos.new(repo) }
  end
end
