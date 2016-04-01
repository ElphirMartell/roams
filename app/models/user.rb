class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :enrollments
  has_many :courses, through: :enrollments
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
end
