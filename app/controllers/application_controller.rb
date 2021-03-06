class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


private
  def require_sign_out!
    redirect_to root_path if user_signed_in?
  end

  def require_sign_in!
    redirect_to new_user_session_path unless user_signed_in?
  end

end
