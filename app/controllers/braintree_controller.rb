class BraintreeController < ApplicationController

  	def new
  		@reservation= Reservation.find(params[:id])
  		@client_token = Braintree::ClientToken.generate
  	end
  

def checkout
  nonce_from_the_client = params[:checkout_form][:payment_method_nonce]
  @reservation = Reservation.find(params[:id])
  result = Braintree::Transaction.sale(
   :amount => "10.00", #this is currently hardcoded
   :payment_method_nonce => nonce_from_the_client,
   :options => {
      :submit_for_settlement => true
    }
   )

  if result.success?
  	ReservationMailer.booking_email(current_user, @reservation.listing.user, @reservation.id).deliver_now
    redirect_to :root, :flash => { :success => "Transaction successful!" }
  else
  	p result
    redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
  end
end
end 