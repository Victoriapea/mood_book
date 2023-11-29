# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
  require 'faker'
  require 'open-uri'

  api_key = 'AIzaSyBwshVXgMANcDkVDw-R-mnQ6lmIKljX6gE'

  api_url = "https://www.googleapis.com/books/v1/volumes?q=science&key=AIzaSyBwshVXgMANcDkVDw-R-mnQ6lmIKljX6gE"

  response = RestClient.get(api_url)
    @books = JSON.parse(response.body)['items']
    @categories = ['science', 'fiction', 'history' , 'love']

  User.create(email: "test@test.test", password: "123456")
  puts 'Creating 5 fake books...'
  5.times do
    book = Book.new(
      name: Faker::Book.title,
      synopsis: " #{Faker::Lorem.paragraph} ",
      author: Faker::Book.author,
      mood: Faker::Emotion.noun
    )
    book.save!
  end
  puts 'Finished!'
