class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.references :user, foreign_key: true
      t.decimal :total_amount, :precision => 5, :scale => 1, default: 0.0

      t.timestamps
    end
  end
end
