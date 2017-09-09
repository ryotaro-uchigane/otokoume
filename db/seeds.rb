# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'forgery'

Faker::Config.locale = :ja


100.times do
  User.create(
      name: Faker::Name.name,
      sex: Faker::Number.between(0,1),
      age: Faker::Number.between(20,25),
      univ: Faker::Number.between(0,4),
      grade: Faker::Number.between(1,5)
  )
end


1000.times do
  Progress.create(
      # name: Forgery(:name).full_name,
      user_id: Faker::Number.between(0, User.count),
      company_name: Faker::Company.name,
      business_category: 0,
      occupation_category: [0,1].sample,
      status: Faker::Number.between(0, 2),
      body: Faker::Lorem.sentence,
      date: Faker::Date.between(2.days.ago, Date.today),
  )
end