class CreateRents < ActiveRecord::Migration[5.2]
  def change
    create_table :rents do |t|
      t.references :user, foreign_key: true
      t.integer :status, default: 0
      t.date :rental_end_date
      t.date :rental_return_date
      t.boolean :return_on_time, default: true
      t.integer :delayed_return_days, default: 0
      t.decimal :rental_total_ammount, :precision => 5, :scale => 1, default: 0.0
      t.decimal :delayed_rental_penalty_amount, :precision => 5, :scale => 1, default: 0.0
      t.decimal :total_to_pay, :precision => 5, :scale => 1, default: 0.0

      t.timestamps
    end
  end
end
