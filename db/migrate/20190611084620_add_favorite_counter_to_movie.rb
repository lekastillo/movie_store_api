class AddFavoriteCounterToMovie < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :user_favorite_movies_count, :integer, default: 0
  end
end
