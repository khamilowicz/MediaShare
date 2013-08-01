require 'spec_helper'

describe MediaHelper do
	let(:address){  "http://www.vimeo.com/123456"}
	let(:helper){
	}

	describe "embed_video" do
		it "calls vimeo frame when vimeo address" do

			pending
		end
	end


	describe "vimeo_frame" do
		it "returns iframe with vimeo player and right id" do
			frame = "<iframe src='http://www.player.vimeo.com/video/123456' >"
			expect( helper.vimeo_frame(address) ).to eq(frame)
		end
	end
end
