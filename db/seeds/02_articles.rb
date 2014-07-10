3.times do |n|
    article = TradeItem.new
    article.title = "Tauschartikel #{TradeItem.all.count + 1}"
    article.description = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod<br/>tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,<br/>quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo<br/>consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse<br/>cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non<br/>proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    article.user = User.first
    article.save!

    image = ItemImage.new
    image.trade_item = article
    image.image = File.open(File.join(Rails.root, 'app', 'assets', 'images', 'dummy_article.jpg'))
    image.save!
end
User.all.each do |user|
  rand(0..3).times do |n|
    article = TradeItem.new
    article.title = "Tauschartikel #{TradeItem.all.count + 1}"
    article.description = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod<br/>tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,<br/>quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo<br/>consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse<br/>cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non<br/>proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    article.user = user
    article.save!

    image = ItemImage.new
    image.trade_item = article
    image.image = File.open(File.join(Rails.root, 'app', 'assets', 'images', 'dummy_article.jpg'))
    image.save!

    puts "#{article.user.full_name} hat einen Gegenstand bei Tauschrausch eingestellt"
  end
end
