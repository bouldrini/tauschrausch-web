User.all.each do |user|
  rand(0..6).times do |n|
    mapping = FollowerMapping.new
    mapping.followed_user = user
    mapping.following_user = User.find(rand(1..User.all.count-1))
    mapping.save
    puts "#{mapping.following_user.full_name} folgt #{mapping.followed_user.full_name}"
  end
end
