class WelcomeController < ApplicationController
  # before_action :authenticate_user!
  def index
  	
  end

  def create_listing
  	render template: 'welcome/listing'
  end
end
