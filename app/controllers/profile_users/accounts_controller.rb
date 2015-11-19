class ProfileUsers::AccountsController < ProfileUsers::BaseController

	def show
		@user = current_user
	end

	def update
		@user = current_user
		if @user.update_attributes(user_params)
			sign_in(@user, :bypass => true)					## Auto loo in when change password
			flash[:notice] = "Cập Nhật Thành Công !"
			redirect_to profile_users_account_path
		else
			flash.now[:alert] = "Cập Nhật Thất Bại ! Hãy Thử Lại !"
			render :show
		end
	end


private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :gender, :address, :phone, :ages, :about_me, :profile_image)
	end

end