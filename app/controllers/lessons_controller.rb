class LessonsController < InheritedResources::Base
  before_action :set_Lesson, only: [:show, :edit, :update, :destroy]

  # GET /lessons
  # GET /lessons.json
  def index
    @lessons = Lesson.all
  end

  # GET /lessons/1
  # GET /lessons/1.json
  def show
    @course = Course.find(params[:course_id])
  	@lessons = @course.lessons
  	@lesson = Lesson.find(params[:id])
  end

  # GET /lessons/new
  def new
  	@course = Course.find(params[:course_id])
    @lesson = Lesson.new
    @lesson.course = @course
  end

  # GET /lessons/1/edit
  def edit
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:id])
    @lesson.course = @course
  end

  # POST /lessons
  # POST /lessons.json
  def create
  	@course = Course.find(params[:course_id])
    @lesson = @course.lessons.build(lesson_params)
    
    respond_to do |format|
      if @lesson.save
        format.html { redirect_to @course, notice: 'lesson was successfully created.' }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessons/1
  # PATCH/PUT /lessons/1.json
  def update
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:id])
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to course_lesson_path(@course, @lesson), notice: 'lesson was successfully updated.' }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    @course = Course.find(params[:course_id])
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to course_path(@course), notice: 'lesson was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_Lesson
      @lesson = Lesson.find(params[:id])
    end

    def lesson_params
      params.require(:lesson).permit(:lesson_id, :title, :body, :course_id)
    end
end

