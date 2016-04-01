class Course < ActiveRecord::Base
	has_many :lessons
	has_many :enrollments
	has_many :users, through: :enrollments
	has_attached_file :image
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end