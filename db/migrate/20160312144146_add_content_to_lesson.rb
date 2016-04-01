class AddContentToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :title, :string
    add_column :lessons, :body, :text
  end
end
