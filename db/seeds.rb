# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Seed Users
user = {}
user['password'] = 'asdf'
# user['password_confirmation'] = 'asdf'

ActiveRecord::Base.transaction do
  20.times do 
    user['name'] = Faker::Name.first_name 
    user['email'] = Faker::Internet.email
    User.create(user)
  end
end 

# Seed Listings
listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  40.times do 
    listing['age']
    listing['country'] = Faker::Address.country
    listing['city'] = Faker::Address.city
    listing['rate'] = rand(80..500)
    listing['description'] = Faker::Hipster.sentence
    listing['bday'] = Faker::Date.between(50.years.ago, Date.today)
    listing['_id'] = uids.sample


    Listing.create(listing)
  end
end
