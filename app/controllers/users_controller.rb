class UsersController < ApplicationController

	# def new
	# 	@user = user_from_params
	# 	render template: "users/new"
	# end

 #  def create

 #    @user = user_from_params
 #    if @user.save
 #      sign_in @user
 #      redirect_back_or url_after_create
 #    else
 #      render template: "users/new"
 #    end
 #  end


	# private 

	# def user_from_params
	#     email = user_params.delete(:email)
	#     password = user_params.delete(:password)
	#     name = user_params.delete(:name)

	#     Clearance.configuration.user_model.new(user_params).tap do |user|
	#       user.email = email
	#       user.password = password
	#       user.name =  name 
	#     end
	#   end
	#   # params.require(:user).permit(:name, :email, :password)


end