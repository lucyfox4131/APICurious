class Organizations < OpenStruct
  def self.all(service)
    service.orgs.map {|org| Organizations.new(org)}
  end
end
