class Users::SessionsController < ApplicationController
	before_action :require_sign_out!, only: :new

	def new
		@user = User.new
	end

	def create
		auth = AuthenticationService.new(User.find_by(email: params[:user][:email]), params[:user][:password]).call
   
    if auth.success?
      if auth.user.activated?
        sign_in auth.user
        flash[:notice] = 'Đăng Nhập Thành Công!'
        redirect_to root_path
      else
        flash[:alert] = 'Tài Khoản Của bạn chưa Kích Hoạt!'
        redirect_to new_user_session_path
      end
    else
      flash[:notice] = auth.error
      redirect_to new_user_session_path
    end
	end

	def destroy
		sign_out
	    flash[:notice] = 'Đăng Xuất Thành Công!'
	    session.delete(:user_id)
	    redirect_to root_path
	end

private
	
	def redirect_path
		
	end
end