module VideoAddress

  ManySites = Class.new(Exception)

  KNOWN_SITES = {
    'youtube' => /youtube/,
    'vimeo' => /vimeo/
  }

  def self.find_site_name address
    sites = KNOWN_SITES.select{|ident, reg| address.match(reg)}.keys
    return sites.first    if sites.size == 1
    return "other"        if sites.empty?
    raise ManySites
  end
end

# p VideoAddress.find_site_name 'youtubeasldas'