class Listing < ApplicationRecord
	belongs_to :user
	has_many :reservations

	serialize :photos, Array
	mount_uploaders :photos, PhotosUploader


	def today_age
		date = Date.strptime(self.bday,'%Y-%m-%d')
		(Date.today - date).to_i / 365
	end
end
