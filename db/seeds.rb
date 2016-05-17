User.destroy_all
RegApp.destroy_all
Event.destroy_all

# Create users
usernames = ["Bert", "Ernie", "Calvin", "Hobbes"]
emails = ["bert@example.com", "ernie@example.com", "calvin@user.com", "hobbes@tiger.com"]

4.times do |i|
  User.create!(
  username: usernames[i],
  email:    emails[i],
  password: "password"
  )
end

users = User.all

# Create applications
10.times do
  RegApp.create!(
  name: Faker::App.name,
  url:  Faker::Internet.url,
  user: users.sample
  )
end

reg_apps = RegApp.all

# Create events
categories = ["Video", "Forms", "Nav", "Social", "Articles", "Link"]
actions = ["Play", "Submit", "Home", "View", "Download", "Click"]

300.times do
  Event.create!(
  category:    categories.sample,
  action:      actions.sample,
  label:       Faker::Commerce.product_name,
  value:       rand(10),
  reg_app:     reg_apps.sample,
  created_at:  Faker::Time.between(2.days.ago, Date.today, :all)
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{RegApp.count} registered apps created"
puts "#{Event.count} events created"
