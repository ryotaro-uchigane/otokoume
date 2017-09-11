# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'forgery'

company_names = [
    'Company1',
    'Company2',
    'Company3',
    'Company4',
    'Company5',
]

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


2000.times do
  Progress.create(
      # name: Forgery(:name).full_name,
      user_id: Faker::Number.between(0, User.count),
      company_name: company_names.sample(),
      business_category: 0,
      occupation_category: [0,1].sample,
      status: Faker::Number.between(0, 2),
      body: Faker::Lorem.sentence,
      date: Faker::Date.between(6.month.ago, Date.today),
  )
end

10.times do
  job = Faker::Job
  business_category = BusinessCategory.create(
      name: job.unique.field,
  )
  5.times do
    OccupationCategory.create(
        business_category_id: business_category.id,
        name: job.unique.title
    )
  end
end

