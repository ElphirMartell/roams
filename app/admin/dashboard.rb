ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do

      column  do
        panel "Most active users" do
          table_for User.all.order('sign_in_count desc').limit(10) do
            column("User")   {|user| user.username                                    }
            column("Times signed in"){|user| user.sign_in_count                     }
          end
        end
      end

      column do
        panel "Most recent users" do
          table_for User.all.where.not('current_sign_in_at' => nil).order('current_sign_in_at desc').limit(10) do
            column("User")   {|user| user.username                                    }
            column("Last online"){|user| user.current_sign_in_at                     }
          end
        end

        panel "Bestsellers" do
            table_for Course.all.order('id') do
                column ("Course") {|course| course.coursename }
                column ("Enrolled students") { |course| Enrollment.where(course_id: course.id).count}
            end
        end
      end

    end
# Enrollment.group(:course_id).order("count(course_id) desc").count
    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
