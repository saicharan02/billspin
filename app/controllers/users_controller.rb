class UsersController < ApplicationController
	include ApplicationHelper
	before_action :require_login, :only => [:edit, :show]

	def new
		@user = User.new
		render :new
	end

	def create
		params[:user][:name] = params[:user][:name].downcase
		@user = User.new(user_params)
	  	@user.guest = false

		if @user.save
			current_user.move_to(@user)
			flash[:notice] = "Account created. Please login."
			redirect_to new_session_url
		else
			flash[:notice] = "Unable to create account. Try again."
			render :new
		end
	end

	def edit
		@user = current_user
		render :edit
	end

	def update
	end

	def show
		@user = current_user
		@bills = @user.bills
		render :show
	end

	def user_params
		params.require(:user).permit(:name, :email, :password, :salt, :encrypted_password)
	end
end
