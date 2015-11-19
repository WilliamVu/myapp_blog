class UsersController < ApplicationController
	before_action :require_sign_out!, only: :new

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "Đăng Ký Thành Công !"
			sign_in(@user)
			#redirect_path
			redirect_to root_path
		else
			render :new
		end
	end

private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :gender, :address, :phone, :ages, :about_me, :profile_image)
	end

	def redirect_path
		
	end
end
