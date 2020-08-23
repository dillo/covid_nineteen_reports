# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

25.times do
  if Pandemic.count < 26
    name = Faker::Alphanumeric.alpha(number: 25)
    description = Faker::Lorem.paragraphs.join(' ')
    Pandemic.create(name: name, description: description)
  end
end

25.times do |index|
  source_name = Faker::Alphanumeric.alpha(number: 7)
  data_type = ['rss', 'json'].sample
  description = Faker::Lorem.paragraphs.join(' ')
  source_url = "https://www.example.com/foo_#{index}.#{data_type}"
  DataUrl.create(source_name: source_name, description: description, data_type: data_type, source_url: source_url)
end
