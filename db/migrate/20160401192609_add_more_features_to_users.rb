class AddMoreFeaturesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :address, :string
    add_column :users, :phone, :integer
    add_column :users, :description, :text
    add_column :users, :company, :string
    add_column :users, :employment, :string
  end
end
