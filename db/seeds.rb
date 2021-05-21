# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Article.create!(title: "article sample", body: "sample body", status: "public")

99.times do |n|
  title = "article sample #{n+1}"
  body = "sample body #{n+1}"
  status = "public"

  Article.create!(title: title, body: body, status: status)
end