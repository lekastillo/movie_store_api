class OrderedRentsQuery
  SORT_RENT_OPTIONS = %w(by_date by_total_to_pay by_status).freeze

  def initialize(params = {}, relation = Rent)
    @relation = relation
    @params = params
  end

  def all
    @relation.public_send(sort_by, direction)
  end

  private
  def sort_by
    @params[:sort_by].presence_in(SORT_RENT_OPTIONS) || :by_status
  end

  def direction
    @params[:direction] == "asc" ? :asc : :desc
  end

end
