class BabesController < ApplicationController

	def babes
		@listings = Listing.where(gender: "Female")
	
	end 

end
