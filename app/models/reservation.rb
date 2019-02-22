class Reservation < ActiveRecord::Base
	belongs_to :listing
	belongs_to :user
	validate :check_overlapping_dates


	def check_overlapping_dates
		listing.reservations.each do |old_booking|
			if overlap?(self , old_booking)
				return errors.add(:overlapping_dates, "The booking dates are conflict with existing reservation. Try another date.")
			end 
		end 
	end 

	def overlap?(x,y)
		(x.start_date_and_time - y.end_date_and_time) * (y.start_date_and_time - x.end_date_and_time) > 0
	end 

def num_of_hours
	(end_date_and_time - start_date_and_time) / 3600
end 

def price_per_hours 
	listing.rate
end 

def total_price
	( listing.rate * num_of_hours)
end 

def name_of_user
	listing.user.name
end 
	# def reserved_dates
	# 	(self.start_date_and_time..self.end_date_and_time).to_a
	# end

end