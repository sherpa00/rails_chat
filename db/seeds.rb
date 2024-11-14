# db/seeds.rb

# Clear existing data if needed
User.destroy_all
Message.destroy_all

# Create sample users
alice = User.create(username: "Alice")
bob = User.create(username: "Bob")

puts "Created users: #{User.pluck(:username).join(', ')}"
