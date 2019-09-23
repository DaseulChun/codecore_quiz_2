# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Idea.destroy_all

NUM_IDEAS = 30

NUM_IDEAS.times do
  created_at = Faker::Date.backward(days: 365 * 5)
  Idea.create(
    title: Faker::ChuckNorris.fact,
    description: Faker::Hacker.say_something_smart,
    created_at: created_at,
    updated_at: created_at,
  )
end

ideas = Idea.all

puts Cowsay.say("Generated #{ideas.count} ideas", :frogs)