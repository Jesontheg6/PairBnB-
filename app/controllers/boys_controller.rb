class BoysController < ApplicationController

	def boys
		@listings = Listing.where(gender: "Male")
	
	end 

end

