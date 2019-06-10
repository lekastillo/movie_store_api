class CreateMovieUpdates < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_updates do |t|
      t.string :field
      t.text :previus_value
      t.references :movie, foreign_key: true

      t.timestamps
    end
  end
end
