me = User.new
me.firstname = 'Richard'
me.lastname = 'Wieditz'
me.gender = 'mr'
me.city = 'Eschwege'
me.zipcode = '37269'
me.birthday = DateTime.new(1992,6,1)
me.email = 'richardwieditz@gmail.com'
me.password = 'a1b2c3d4'
me.password_confirmation = 'a1b2c3d4'
me.image = File.open(File.join(Rails.root, 'app', 'assets', 'images', 'dummy_user_male.jpg'))
me.save!

puts "#{me.full_name} aus #{me.city} ist Tauschrausch beigetreten"

friend = User.new
friend.firstname = 'Marvin'
friend.lastname = 'Köhler'
friend.gender = 'mr'
friend.city = 'Göttingen'
friend.zipcode = '37073'
friend.birthday = DateTime.new(1993,4,1)
friend.email = 'marvinaugistin@gmail.com'
friend.password = 'a1b2c3d4'
friend.password_confirmation = 'a1b2c3d4'
friend.image = File.open(File.join(Rails.root, 'app', 'assets', 'images', 'dummy_user_male.jpg'))
friend.save!

puts "#{friend.full_name} aus #{friend.city} ist Tauschrausch beigetreten"

friend = User.new
friend.firstname = 'Sophie'
friend.lastname = 'Eckhardt'
friend.gender = 'mrs'
friend.city = 'Kassel'
friend.zipcode = '34117'
friend.birthday = DateTime.new(1994,9,1)
friend.email = 'soso.sophie@gmx.com'
friend.password = 'a1b2c3d4'
friend.password_confirmation = 'a1b2c3d4'
friend.image = File.open(File.join(Rails.root, 'app', 'assets', 'images', 'dummy_user_female.jpg'))
friend.save!

puts "#{friend.full_name} aus #{friend.city} ist Tauschrausch beigetreten"

SALUTATIONS = %w{dr prof}
CITIES = [{name: 'Kassel', zip: '34117'}, {name: 'Göttingen', zip: '37073'}, {name: 'Erfurt', zip: '99084'}]
10.times do |n|
  city = CITIES[rand(0..2)]
  address = AddressGenerator.generate
  user = User.new
  user.firstname = address[:firstname]
  user.salutation = SALUTATIONS[rand(0..1)]
  user.lastname = address[:lastname]
  user.city = city[:name]
  user.zipcode = city[:zip]
  user.birthday = Time.at(rand * Time.now.to_i)
  user.email = address[:email]
  user.password = 'a1b2c3d4'
  user.password_confirmation = 'a1b2c3d4'
  if address[:gender] == 'female'
    user.gender = 'mrs'
    user.image = File.open(File.join(Rails.root, 'app', 'assets', 'images', 'dummy_user_female.jpg'))
  else
    user.gender = 'mr'
    user.image = File.open(File.join(Rails.root, 'app', 'assets', 'images', 'dummy_user_male.jpg'))
  end
  user.save
  puts "#{user.full_name} aus #{user.city} ist Tauschrausch beigetreten"

end
