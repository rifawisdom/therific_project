# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
user = {}
user['password'] = 'asdf'
user['password_confirmation'] = 'asdf'

ActiveRecord::Base.transaction do
40.times do
  user['name'] = Faker::Ancient.god
  user['age'] = rand(20..50)
  user['phone'] = rand(60130000000..60169999999)
  user['gender']=["Male","Female"].sample
  user['email'] = Faker::Internet.email
  user['role'] = rand(0..1)

  User.create(user)
end
end

therapist = {}
uids = []
User.where(role:1).each { |d| uids<<d.id }


ActiveRecord::Base.transaction do
15.times do
    therapist['address']=Faker::Address.city 
    therapist['coins'] = rand(1..1000)
    therapist['user_id'] = uids.uniq.sample
    
    Therapist.create(therapist)
end
end