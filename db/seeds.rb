require 'faker'
require 'open-uri'
api_key = 'AIzaSyBwshVXgMANcDkVDw-R-mnQ6lmIKljX6gE'
categories = ['happy', 'sad', 'excited', 'calm', 'serious']

moods = ['happy', 'sad', 'excited', 'calm', 'serious']

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
        Book.create(
          name: book_data['volumeInfo']['title'],
          synopsis: book_data['volumeInfo']['description'] || 'No description available',
          author: authors.join(', ').presence || 'Unknown Author',
          mood: moods.sample,
          category: category,
          image: image_thumbnail,
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
