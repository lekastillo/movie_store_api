
class MovieObserver < Everett::Observer
  def before_validation(movie)
    Rails.logger.info("Movie #{movie.id}: changed ")
    if movie.title_changed?
      MovieUpdate.create(movie: movie, field: 'title', previus_value: movie.title, admin_id: movie.admin_id)
    end

    if movie.description_changed?
      MovieUpdate.create(movie: movie, field: 'description', previus_value: movie.description, admin_id: movie.admin_id)
    end

    if movie.status_changed?
      MovieUpdate.create(movie: movie, field: 'status', previus_value: movie.status, admin_id: movie.admin_id)
    end
    if movie.stock_changed?
      MovieUpdate.create(movie: movie, field: 'stock', previus_value: movie.stock, admin_id: movie.admin_id)
    end
    if movie.rental_price_changed?
      MovieUpdate.create(movie: movie, field: 'rental_price', previus_value: movie.rental_price, admin_id: movie.admin_id)
    end
    if movie.sale_price_changed?
      MovieUpdate.create(movie: movie, field: 'sale_price', previus_value: movie.sale_price, admin_id: movie.admin_id)
    end
    if movie.delayed_return_penalty_amount_changed?
      MovieUpdate.create(movie: movie, field: 'delayed_return_penalty_amount', previus_value: movie.delayed_return_penalty_amount, admin_id: movie.admin_id)
    end

  end
end
