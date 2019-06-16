class MovieRent < ApplicationRecord
  belongs_to :rent, inverse_of: :movie_rents
  belongs_to :movie

  after_create :calculate_total_rent_per_day, :discount_stock_movie

  validate :movie_availability

  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
  validates :movie_id, uniqueness: {scope: :rent_id }, allow_blank: false


  def calculate_total_rent_per_day

    rent_days = rent.rental_days
    rent.update_column(:rental_total_ammount, rent.rental_total_ammount+(quantity*(movie.rental_price*rent_days)))
    rent.update_column(:total_to_pay, rent.rental_total_ammount+(quantity*(movie.rental_price*rent_days)))
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
# Table name: movie_rents
#
#  id         :bigint           not null, primary key
#  rent_id    :bigint
#  movie_id   :bigint
#  quantity   :integer          default(1)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_movie_rents_on_movie_id  (movie_id)
#  index_movie_rents_on_rent_id   (rent_id)
#
# Foreign Keys
#
#  fk_rails_...  (movie_id => movies.id)
#  fk_rails_...  (rent_id => rents.id)
#
