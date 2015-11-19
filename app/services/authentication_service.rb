class AuthenticationService
  def initialize(user, password)
    @user = user || User.new
    @password = password
  end

  def call
    AuthenticationResult.new(@user, valid_user? || valid_password?)
  end

  private

  def valid_user?
    'Email không đúng !' unless @user.persisted?
  end

  def valid_password?
    'Mật Khẩu không đúng !' unless @user.valid_password?(@password)
  end
end

class AuthenticationResult
  attr_reader :user, :error

  def initialize(user, error = nil)
    @user = user || User.new
    @error = error || ''
  end

  def success?
    @error.blank?
  end
end