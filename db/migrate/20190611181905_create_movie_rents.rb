class CreateMovieRents < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_rents do |t|
      t.references :rent, foreign_key: true
      t.references :movie, foreign_key: true
      t.integer :quantity, default: 1

      t.timestamps
    end
  end
end
