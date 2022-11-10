require 'open-uri'
require 'json'

puts 'Cleaning movie db...'
Movie.destroy_all

url = 'http://tmdb.lewagon.com/movie/top_rated?'

movies = URI.open(url).read
movies_json = JSON.parse(movies)
# pp moviesJSON["results"][0]

movies_json['results'].each do |result|
  movie = Movie.create!(
    title: result['title'],
    overview: result['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500#{result['poster_path']}",
    rating: result['vote_average'].to_f
  )
  puts "created movie ID #{movie.id}"
end

puts 'All done. Happy watching!'
