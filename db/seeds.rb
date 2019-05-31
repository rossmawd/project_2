# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

User.destroy_all
Project.destroy_all
Task.destroy_all
Tag.destroy_all
TaskTag.destroy_all

3.times do
  User.create(
    name: Faker::TvShows::RickAndMorty.unique.character,
    user_name: Faker::GreekPhilosophers.unique.name,
    password: "123",
  )
end

10.times do
  Project.create(
    name: "#{Faker::Verb.base.downcase} #{Faker::Educator.unique.subject.downcase}",
    user_id: User.all.sample.id,
    description: Faker::Movies::HitchhikersGuideToTheGalaxy.unique.quote,
  )
end

30.times do
  Task.create(
    name: Faker::Marketing.buzzwords.downcase,
    project_id: Project.all.sample.id,
    archive: false,
    time: [5,10,30,60].sample
  )
end

Tag.create(name: "@email")
Tag.create(name: "@online")
Tag.create(name: "@phone")
Tag.create(name: "@work")
Tag.create(name: "@Doug")

50.times do
  TaskTag.create(
    tag_id: Tag.all.sample.id,
    task_id: Task.all.sample.id,
  )
end
