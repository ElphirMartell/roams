ActiveAdmin.register User do
  menu :priority => 3
  permit_params :username, :first_name, :last_name, :email, :password, :password_confirmation, :admin, :teacher

  index do
    selectable_column
    id_column
    column :username
    column :first_name
    column :last_name
    column :email
    column :admin
    column :teacher
    column :current_sign_in_at
    column :sign_in_count
    actions
  end

  filter :username
  filter :first_name
  filter :last_name
  filter :email
  filter :admin
  filter :teacher
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "User Details" do
      f.input :username
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :admin
      f.input :teacher
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
