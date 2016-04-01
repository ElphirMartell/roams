# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(username: 'sergio.roa',
	first_name: 'Sergio',
	last_name: 'Roa',
	email: 'admin@example.com',
	admin: true,
	teacher: false,
	password: 'password', 
	password_confirmation: 'password', 
	avatar: Faker::Avatar.image, 
	city: Faker::Address.city, 
	address: Faker::Address.street_address,
	country: Faker::Address.country,
	phone: Faker::Number.number(9),
	description: Faker::Lorem.paragraph(3))

95.times do 
	User.create!(username: Faker::Internet.user_name, 
		first_name: Faker::Name.first_name, 
		last_name: Faker::Name.last_name, 
		email:  Faker::Internet.email,
		admin: false,
		teacher: false,
		password: 'password',
		password_confirmation: 'password',
		avatar: Faker::Avatar.image,
		city: Faker::Address.city,
		address: Faker::Address.street_address,
		country: Faker::Address.country,
		phone: Faker::Number.number(9),
		description: Faker::Lorem.paragraph(3))
end

5.times do
	User.create!(username: Faker::Internet.user_name, 
		first_name: Faker::Name.first_name, 
		last_name: Faker::Name.last_name, 
		email:  Faker::Internet.email,
		admin: false,
		teacher: true,
		password: 'password',
		password_confirmation: 'password',
		avatar: Faker::Avatar.image,
		city: Faker::Address.city,
		address: Faker::Address.street_address,
		country: Faker::Address.country,
		phone: Faker::Number.number(9),
		description: Faker::Lorem.paragraph(3))
end

