require 'faker'
require 'bcrypt'


10.times do 
	User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, 
		digest: BCrypt::Password.create(Faker::Lorem.word))
end

20.times do
	Post.create(title: Faker::Lorem.word, content: Faker::Lorem.words(rand(8..20)).join(" "), 
				user_id: rand(1..10))
end

5.times do
	Like.create(user_id: rand(1..10), post_id: rand(1..20))
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

5.times do |i|
	User.find(i+1).followed_id << User.find(5+i)
end