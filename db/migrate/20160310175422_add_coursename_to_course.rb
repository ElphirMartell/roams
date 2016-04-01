class AddCoursenameToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :coursename, :string
    add_column :courses, :teacher, :string
    add_column :courses, :start_date, :datetime
    add_column :courses, :end_date, :datetime
  end
end
