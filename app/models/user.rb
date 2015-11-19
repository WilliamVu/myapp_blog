class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :current_password
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum gender: 	[:male, :female]
  enum role: 	[:user, :admin]
  enum status: 	[:activated, :deactivated]

  attachment :profile_image
end
