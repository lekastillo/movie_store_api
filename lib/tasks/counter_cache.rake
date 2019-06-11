desc 'Counter cache for movie has many user_favorite_movies'

task user_favorite_movies_counter: :environment do
  Movie.reset_column_information
  Movie.all.find_each do |p|
    Movie.reset_counters p.id, :user_favorite_movies
  end
end