require 'faker'
require 'open-uri'

puts 'Creating user'
User.create(email: "test@test.test", password: "123456")
puts 'Done creating'

api_key = 'AIzaSyBwshVXgMANcDkVDw-R-mnQ6lmIKljX6gE'
categories = ['happy', 'sad', 'excited', 'calm', 'serious', 'angry']
moods = ['happy', 'sad', 'excited', 'calm', 'serious', 'angry']

mood_images = {
  'happy' => 'pleurs.png',
  'sad' => 'triste.png',
  'excited' => 'baiser.png',
  'calm' => 'colere.png',
  'serious' => 'choc.png',
  'angry' => 'colere.png'
}

categories.each do |category|
  api_url = "https://www.googleapis.com/books/v1/volumes?q=#{category}&key=#{api_key}"
  response = RestClient.get(api_url)
  if response.code == 200
    books_data = JSON.parse(response.body)['items']
    puts "Books for #{category}:"
    if books_data.present?
      books_data.each do |book_data|
        image_thumbnail = book_data['volumeInfo']['imageLinks']&.fetch('thumbnail', nil)
        authors = book_data['volumeInfo']['authors'] || []
        mood_name = moods.sample
        mood = Mood.find_or_create_by(name: mood_name)
        image_for_mood = mood_images[mood_name]

        Book.create(
          name: book_data['volumeInfo']['title'],
          synopsis: book_data['volumeInfo']['description'] || 'No description available',
          author: authors.join(', ').presence || 'Unknown Author',
          mood: mood,
          category: category,
          image: image_thumbnail || image_for_mood,
          page_count: book_data['volumeInfo']['pageCount'],
          preview_link: book_data['volumeInfo']['previewLink']
        )
      end
    else
      puts "  No books found for #{category}."
    end
  else
    puts "Error fetching books for #{category}: #{response.code}"
  end
end

puts 'Seed data created!'
