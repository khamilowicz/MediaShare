module MediaHelper

	AddressReceipt = {
		youtube: {
			matcher: /\/watch\?v=(.+)/, 
			matcher_index: 1, 
			embed_prefix: "http://www.youtube.com/embed/"
		}
	}

	def vimeo_frame address
		number = address.match(/\d+/)[0]
		address_real = "http://player.vimeo.com/video/#{number}"
		iframe_tag address_real
	end

	def youtube_frame address
		identifier = address.match(/\/watch\?v=(.+)/)[1]
		address_real = "http://www.youtube.com/embed/#{identifier}"
		iframe_tag address_real
	end

	def iframe_tag address
		content_tag(:iframe, src: address )do end
	end

	def embed_video medium
		address = medium.address
		site = VideoAddress.find_site_name(address)
		send site + "_frame", address
	end
end