class AddAdminToMovieUpdate < ActiveRecord::Migration[5.2]
  def change
    add_reference :movie_updates, :admin, foreign_key: true
  end
end
