5.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end
users = User.all

20.times do
  RegisteredApplication.create!(
    user: users.sample,
    name: Faker::Internet.domain_name,
    url: Faker::Internet.url
  )
end
apps = RegisteredApplication.all

100.times do
  Event.create!(
    registered_application: apps.sample,
    name: Faker::Hacker.noun
  )
end
events = Event.all

puts "Seed finished"
puts "#{users.count} users created"
puts "#{apps.count} apps created"
puts "#{events.count} events created"
