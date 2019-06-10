class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.integer :status, default: 0
      t.integer :stock, default: 0
      t.decimal :rental_price, :precision => 5, :scale => 1, default: 0.0
      t.decimal :sale_price, :precision => 5, :scale => 1, default: 0.0
      t.decimal :delayed_return_penalty_amount, :precision => 5, :scale => 1, default: 0.0

      t.timestamps
    end
  end
end
