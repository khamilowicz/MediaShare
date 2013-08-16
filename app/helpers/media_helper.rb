module MediaHelper

	def sites_store
		@store  ||= VideoAddress.store 
	end

	def video_frame site, address
		site_data = sites_store[site]

		matcher, matcher_index      =   Regexp.new(site_data[:matcher]) , site_data[:matcher_index]
		embed_prefix, embed_suffix  =   site_data[:embed_prefix]        , site_data[:embed_suffix]

		identifier    =   address.match( matcher )[matcher_index]
		address_real  =   [embed_prefix, identifier, embed_suffix].join
		iframe_tag address_real	
	end

	def iframe_tag address
		content_tag(:iframe, src: address ){}
	end

	def embed_video medium
		address = medium.address
		site = VideoAddress.find_site_name(address)
		video_frame site, address
	end

	def embed_medium medium
		return image_tag(medium.address) if picture? medium
		embed_video medium
	end

	def picture? medium
		medium.address.match(image_formats_regexp)
	end

	def image_formats_regexp
		@image_formats ||= Regexp.union File.read(Rails.root.join('lib', 'assets', 'image_formats.txt')).split(',').map(&:strip)
	end
end