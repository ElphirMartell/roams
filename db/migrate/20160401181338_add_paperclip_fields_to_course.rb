class AddPaperclipFieldsToCourse < ActiveRecord::Migration
  def change
  	add_column :courses, :image_file_name,    :string
    add_column :courses, :image_content_type, :string
    add_column :courses, :image_file_size,    :integer
    add_column :courses, :image_updated_at,   :datetime
  end
end
