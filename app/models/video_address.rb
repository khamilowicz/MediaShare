module VideoAddress

  ManySites = Class.new(Exception)

  attr_reader :store

  def self.find_site_name address
    sites = match_from_hash(address, store, 'matcher_name').keys
    return sites.first    if sites.size == 1
    return "other"        if sites.empty?
    raise ManySites
  end

  def self.match_from_hash string, hash, inner_key=nil
    hash.select do |ident, data| 
      matcher = inner_key ? data[inner_key] : data
      string.match(matcher)
    end
  end

  def self.store
    @store ||= HashWithIndifferentAccess
      .new YAML
      .load( File.read('./lib/assets/video_sites.yml'))
  end
end