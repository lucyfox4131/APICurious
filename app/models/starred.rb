class Starred < OpenStruct
  def self.all(service)
    service.starred.each { |starred| Starred.new(starred) }
  end
end
