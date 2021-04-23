class UsersController < ApplicationController
	include ApplicationHelper
	# before_action :require_login, :only => [:show]

	def new
		@user = User.new
		render :new
	end

	def create
		params[:user][:name] = params[:user][:name].downcase
		@user = user_params ? User.new(user_params) : User.new_guest
		# @user = User.new(user_params)
		# @user.guest = false

		if @user.save
			current_user.move_to(@user) if current_user && current_user.guest?
			login_user(@user)
			flash[:notice] = "Account created. Please login."
			redirect_to user_url(@user)
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
		# @payments = Debt.where(:creditor_id => @user.id, :is_a_payment => true)
		render :show
	end

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end
end
	

