require 'faker'
require 'bcrypt'


50.times do
	User.create(username: Faker::Internet.user_name, email: Faker::Internet.email,
		digest: BCrypt::Password.create(Faker::Lorem.word))
end

200.times do
	Post.create(title: Faker::Lorem.word, content: Faker::Hacker.say_something_smart,
				user_id: rand(1..49))
end

100.times do
	Like.create(user_id: rand(1..49), post_id: rand(1..200))
end

# relationships = []
# while relationships.length < 10
# 	leader=rand(1..10)
# 	follower=leader
# 	while follower==leader
# 		follower=rand(1..10)
# 	end
# 	relationships << [leader, follower]
# 	relationships.uniq!
# end

# relationships.each do |pair|
# 	Follower.create(user_id: pair[0], followed_id: pair[1])
# end

25.times do |i|
	User.find(i+1).followed_id << User.find(5+i)
end
