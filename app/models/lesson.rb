class Lesson < ActiveRecord::Base
	belongs_to :course
	slice :body, :as => :paged, :slice => {:complete => /\s+/, :maximum => 10000}
end
