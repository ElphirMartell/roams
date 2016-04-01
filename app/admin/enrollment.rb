ActiveAdmin.register Enrollment do
  permit_params :user, :course, :user_id, :course_id 
  menu :priority => 3

  @courses = Course.all.map { |course| [course.coursename, course.id] }
  
  index do
    selectable_column
    id_column
    column :user
    column :course do |enrollment| enrollment.course.coursename end
    actions
  end

  filter :course, collection: @courses
  filter :user

  form do |f|
    f.inputs "New enrollment" do
      @courses = Course.all.map { |course| [course.coursename, course.id] }
	    f.input :course, collection: @courses
	    f.input :user
    end
    f.actions
  end

end
