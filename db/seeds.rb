# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
95.times do 
	User.create!(username: Faker::Internet.user_name, 
		first_name: Faker::Name.first_name, 
		last_name: Faker::Name.last_name, 
		email:  Faker::Internet.email,
		admin: false,
		teacher: false,
		password: 'password',
		password_confirmation: 'password')
end

5.times do
	User.create!(username: Faker::Internet.user_name, 
		first_name: Faker::Name.first_name, 
		last_name: Faker::Name.last_name, 
		email:  Faker::Internet.email,
		admin: false,
		teacher: true,
		password: 'password',
		password_confirmation: 'password')
end

