class AddIdToEnrollment < ActiveRecord::Migration
  def change
    add_reference :enrollments, :user, index: true
    add_reference :enrollments, :course, index: true
  end
end
