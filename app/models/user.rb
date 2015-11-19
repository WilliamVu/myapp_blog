class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum gender: 	[:male, :female]
  enum role: 	[:user, :admin]
  enum status: 	[:activated, :deactivated]
end
