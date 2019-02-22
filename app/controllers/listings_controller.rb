class ListingsController < ApplicationController

  before_action :set_listing, only: [:show, :edit, :update, :destroy]
 def new
    @listing = Listing.new
  end

  def create
	 @listing = current_user.listings.new(gender: params[:gender],  age: params[:age], rate: params[:rate], city: params[:city], country: params[:country], bday: params[:bday], description: params[:description], photos: params[:listing][:photos])
    if @listing.save 
      redirect_to @listing
    else 
       flash[:danger] = 'Sorry please try again'
       render :new
    end
  end

   def edit  
     @listing = Listing.find(params[:id])

   end

  def update
  	 @listings = Listing.find(params[:id])
    if @listings.update(gender: params[:gender],  age: params[:age], rate: params[:rate], city: params[:city], country: params[:country], bday: params[:bday], description: params[:description], photos: params[:listing][:photos])
     render "show2"
        else 
    	flash[:danger] = 'Error updating listing'
    	render :edit
    end
  end


  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
  end


  def show
  end

  def info
    @listing = Listing.find(params[:id])
  end 


  private

  def set_listing
  end

  #  def listing_params
  #   params.require(:listing).permit(:gender, :rate, :age, :country, :city, :user_id, :country, photos: [], {photos:[]})
  # end
end 