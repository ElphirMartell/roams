class AddCourseRefToSurveySurvey < ActiveRecord::Migration
  def change
    add_reference :survey_surveys, :course, index: true, foreign_key: true
  end
end
