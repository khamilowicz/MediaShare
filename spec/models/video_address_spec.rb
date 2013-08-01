describe VideoAddress do
	it ".find_site_name retruns generic site name from address" do
		address = 'http://www.vimeo.com/2324323243'
		VideoAddress.find_site_name(address).should eq(:vimeo)
		address = 'http://www.youtube.com/1324'
		VideoAddress.find_site_name(address).should  eq(:youtube)
		address = 'something different'
		VideoAddress.find_site_name(address).should  eq(:other)
	end
end