class MoviePurchase < ApplicationRecord
  belongs_to :purchase, inverse_of: :movie_purchases
  belongs_to :movie
  after_create :calculate_total_purchase, :discount_stock_movie

  validate :movie_availability
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
  validates :movie_id, uniqueness: {scope: :purchase_id }, allow_blank: false


  def calculate_total_purchase
    purchase.update_column(:total_amount, purchase.total_amount+(quantity*movie.sale_price) )
  end

  def discount_stock_movie
    movie.update_column(:stock, movie.stock-quantity)
  end

  def movie_availability

    if movie.stock < quantity
      errors.add(:availability, "No hay suficientes: #{movie.title}")
    end
  end

end

# == Schema Information
#
# Table name: movie_purchases
#
#  id          :bigint           not null, primary key
#  purchase_id :bigint
#  movie_id    :bigint
#  quantity    :integer          default(1)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_movie_purchases_on_movie_id     (movie_id)
#  index_movie_purchases_on_purchase_id  (purchase_id)
#
# Foreign Keys
#
#  fk_rails_...  (movie_id => movies.id)
#  fk_rails_...  (purchase_id => purchases.id)
#
