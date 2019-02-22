class ReservationsController < ApplicationController
	def new
		@listing = Listing.find(params[:listing_id])
		@reservation = Reservation.new

	end

	def reservation_params
      params.require(:reservation).permit(:user_id, :listing_id, :start_date_and_time, :end_date_and_time, :comments)
    end

	def create
		@listing = Listing.find(params[:reservation][:listing_id])
		@reservation = current_user.reservations.new(reservation_params)
		@reservation.listing = @listing # setting the listing_id col take value from this objexct @listing
		if @reservation.save
		#Tell the ReservationMailer to send a welcome email after save
		render template: "reservations/show"
		else 
		flash[:notice]="booking unsuccessful: check that dates are not already booked?"
		render :new	
		end
	end

	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
		render template:"reservations/deleted"
	end
	def show
		@reservation = Reservation.find(params[:id])
	end

	def my_reservation
		@reservation = current_user.reservations
	 
	end

	def host_reservation
		# @listings = current_user.listings #all my posted listings
		@reservation = Reservation.find(params[:id])
		render :host_reservation
		# @reservation = Reservation.find(params[:reservation][:listing_id])
		# @user = User.find(params[:reservation_id][:listing_id])
	end 


end 
