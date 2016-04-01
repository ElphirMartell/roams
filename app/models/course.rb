class Course < ActiveRecord::Base
	has_many :lessons
	has_many :enrollments
	has_many :users, through: :enrollments
	has_attached_file :image, styles: { medium: "500x500>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end