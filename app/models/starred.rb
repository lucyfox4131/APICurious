class Starred < OpenStruct
  def self.all(service)
    service.starred.map { |starred| Starred.new(starred) }
  end
end
