# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'
puts 'Cleaning database...'
Movie.destroy_all if Rails.env.development?
List.destroy_all if Rails.env.development?

puts 'Generating seed...'
# the Le Wagon copy of the API
url = 'http://tmdb.lewagon.com/movie/top_rated'
response = JSON.parse(URI.open(url).read)

response['results'].each do |movie_hash|
  Movie.create!(
    title: movie_hash['original_title'],
    overview: movie_hash['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie_hash['poster_path']}",
    rating: movie_hash['vote_average']
  )
end

6.times do
  List.create!(
    name: Faker::TvShows::Supernatural.creature
  )
end
puts 'Finished!'
