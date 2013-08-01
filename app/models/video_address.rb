module VideoAddress

  ManySites = Class.new(Exception)

  attr_reader :store

  def self.find_site_name address
    sites = select_key(store, 'matcher_name').select{|ident, regex| address.match(regex)}.keys
    return sites.first    if sites.size == 1
    return "other"        if sites.empty?
    raise ManySites
  end

  def self.select_key hash, key
    new_hash = {}
    hash.each{|k,v| new_hash[k] = v[key]}
    new_hash
  end

  def self.store
    @store ||= HashWithIndifferentAccess.new YAML.load(File.read('./lib/assets/video_sites.yml'))
  end
end