# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# Generate 20 athletes
(1..20).each do |id|
  User.create(
    :name => Faker::Name.name, 
    :email => Faker::Internet.email,
    :password => 'password', 
    :password_confirmation => 'password',
    :role => 'athlete'
  )
end

position_array = ["Point Guard", "Shooting Guard", "Small Forward", "Power Forward", "Center"]
num = Random.new
# Generate stats for athletes
User.athlete.each do |athlete|
  Statistic.create(
    :position => position_array.sample,
    :height => num.rand(170..210),
    :weight => num.rand(70..120),
    :points => (num.rand(1.0..30.0)).round(1),
    :rebounds => (num.rand(1.0..10.0)).round(1),
    :assists => (num.rand(1.0..10.0)).round(1),
    :blocks => (num.rand(1.0..3.0)).round(1),
    :steals => (num.rand(1.0..3.0)).round(1),
    :user_id => athlete.id
  )
end