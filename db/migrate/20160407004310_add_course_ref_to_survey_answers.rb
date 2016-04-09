class AddCourseRefToSurveyAnswers < ActiveRecord::Migration
  def change
    add_reference :survey_answers, :course, index: true, foreign_key: true
  end
end
