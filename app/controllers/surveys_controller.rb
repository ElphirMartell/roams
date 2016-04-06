class SurveysController < InheritedResources::Base
  helper_method :survey
  before_filter :load_survey, only: [:show, :edit, :update, :destroy]

  def new
    @course = Course.find(params[:course_id])
    @survey = Survey::Survey.new(survey_type: view_context.get_survey_type(params[:type]))
    @survey.course = @course
  end

  def create
    @course = Course.find(params[:course_id])
    @survey = @course.surveys.build(survey_params)
    if @survey.valid? && @survey.save
      default_redirect
    else
      build_flash(@survey)
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @survey.update_attributes(survey_params)
      default_redirect
    else
      build_flash(@survey)
      render :edit
    end
  end

  def destroy
    @survey.destroy
    default_redirect
  end

  private

  def default_redirect
    redirect_to course_surveys_path, notice: I18n.t("surveys_controller.#{action_name}")
  end

  private

  def set_survey
    @survey = Survey::Survey.find(params[:id])
  end

  def survey_params
    params.require(:survey_survey).permit(Survey::Survey::AccessibleAttributes << :survey_type, :id)
  end

end
