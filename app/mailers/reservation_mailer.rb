class ReservationMailer < ApplicationMailer

	def booking_email(customer, host, reservation_id)
		@listing = Reservation.find(reservation_id).listing
		@host = host
		@customer = customer
		@url = "http://localhost:3000/reservations/#{reservation_id}/imhost"

		mail(to: @host.email, subject: "You have received a booking from #{@customer.name}")
	end
  	
end
