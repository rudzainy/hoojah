# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Seed into categories table

categories = ["Arts", "Automotive", "Current Affairs", "Economics", "Education", "Entertainment", "Fashion", "Health", "Movies", "Music", "Politics", "Religion", "Sports", "Technology", "Uncategorizes"]

categories.each do |category|
	Category.create(name: category)
end

roles = ["Admin", "Moderator", "Regular", "Guest"]

roles.each do |role|
	Role.create(name: role)
end

#create admin
User.create!(name: "Tommy Middlefinger", email: "tommy@gmail.com", 
  	         role_id: 1, password: "111222333" , password_confirmation: "111222333")


#create moderator
User.create!(name:"Chester", email:"chesterajohn@gmail.com", role_id: 2, 
	         password:"111222333", password_confirmation:"111222333")


#create regular users
13.times do |a|
  name = Faker::Name.name
  email = "user-#{a + 1}@email.com"
  password = "111222333"
  user = User.create!(name: name, email: email, 
  	                  password: password , password_confirmation: password)
end

users = User.all
categories = Category.all
images = ["http://madarauchiha.com/wp-content/uploads/2014/06/doraemon-coming.jpg", "http://oyster.ignimgs.com/wordpress/stg.ign.com/2013/05/mighty-morphin-power-rangers-team-copy.jpg", "http://pad2.whstatic.com/images/thumb/e/e9/Draw-Pikachu-Step-14.jpg/670px-Draw-Pikachu-Step-14.jpg"]

#create opinion for each category
categories.each do |category|
    Opinion.create(image: images.sample, user_id: users.sample.id, category_id: category.id,
    	             title: Faker::Lorem.sentence(1), option1: "Yes", option2: "Nope")
end

opinions = Opinion.all

#create user comment for each opinion
opinions.each do |opinion|
  users.each do |user|
    text = Faker::Lorem.sentence(1)
	  comment = opinion.comments.create(text: text)
    user.comments << comment
  end
end