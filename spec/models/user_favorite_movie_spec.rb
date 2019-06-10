require 'rails_helper'

RSpec.describe UserFavoriteMovie, type: :model do
  it "is valid with valid attributes" do
    user_favorite_movie = FactoryBot.create(:user_favorite_movie, :full)
    expect(user_favorite_movie).to be_valid
  end

  it "validate duplicate favorite" do
    user = FactoryBot.create(:user)
    movie =  FactoryBot.create(:movie, :full)

    user_favorite_movie = UserFavoriteMovie.create(user: user, movie: movie)
    user_favorite_movie_duplicate = UserFavoriteMovie.create(user: user, movie: movie)

    expect(user_favorite_movie_duplicate).to_not be_valid, lambda { user_favorite_movie.errors.full_messages.join("\n") }
  end
end

# == Schema Information
#
# Table name: user_favorite_movies
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  movie_id   :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_user_favorite_movies_on_movie_id  (movie_id)
#  index_user_favorite_movies_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (movie_id => movies.id)
#  fk_rails_...  (user_id => users.id)
#
