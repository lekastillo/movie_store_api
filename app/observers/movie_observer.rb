
class MovieObserver < Everett::Observer
  def before_validation(movie)
    Rails.logger.info("Movie #{movie.id}: changed ")
    if movie.title_changed?
      MovieUpdate.create(movie: movie, field: 'title', previus_value: movie.title)
    end

    if movie.description_changed?
      MovieUpdate.create(movie: movie, field: 'description', previus_value: movie.description)
    end

    if movie.status_changed?
      MovieUpdate.create(movie: movie, field: 'status', previus_value: movie.status)
    end
    if movie.stock_changed?
      MovieUpdate.create(movie: movie, field: 'stock', previus_value: movie.stock)
    end
    if movie.rental_price_changed?
      MovieUpdate.create(movie: movie, field: 'rental_price', previus_value: movie.rental_price)
    end
    if movie.sale_price_changed?
      MovieUpdate.create(movie: movie, field: 'sale_price', previus_value: movie.sale_price)
    end
    if movie.delayed_return_penalty_amount_changed?
      MovieUpdate.create(movie: movie, field: 'delayed_return_penalty_amount', previus_value: movie.delayed_return_penalty_amount)
    end

  end
end
