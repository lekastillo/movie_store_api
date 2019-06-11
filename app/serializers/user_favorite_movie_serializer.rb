class UserFavoriteMovieSerializer < ActiveModel::Serializer
  belongs_to :movie
  belongs_to :user
  attributes :id, :user, :movie

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
