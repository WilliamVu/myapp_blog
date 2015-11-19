class ProfileUsers::BaseController < ApplicationController

  before_action :require_sign_in!

end
