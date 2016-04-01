ActiveAdmin.register Course do
	permit_params :coursename, :teacher, :start_date, :end_date, :user, :course_id
	menu :priority => 2

	teachers = User.where(teacher: true)
	enrolled_students = Enrollment.all

	index do
		selectable_column
		id_column
		column "Coursename", :coursename do |course|
			link_to course.coursename, course_path(course.id)
		end
		column "Teacher", :teacher
		column "Enrolled students", :enrollment do |course| Enrollment.where(course_id: course.id).count end
		column "Start date", :start_date
		column "End date", :end_date
		column :created_at
		column :updated_at
		actions
	end
	


	form do |f|
    	f.inputs "New course" do
    	  teachers.map do |teacher| teacher.username end
	      f.input :coursename
	      f.input  :teacher, collection: teachers.map do |teacher| teacher.username end
	      f.input :start_date, as: :datepicker
	      f.input :end_date, as: :datepicker
        end
        f.actions
  	end
end
