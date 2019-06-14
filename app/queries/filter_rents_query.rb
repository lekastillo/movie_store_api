class FilterRentsQuery
  FILTER_RENT_OPTIONS = %w(filter_by_status filter_by_date).freeze

  def initialize(params = {}, relation = Rent)
    @relation = relation
    @params = params
  end

  def all
    @params[:filter_by].present? ? @relation.search(@params[:q]) : @relation
  end

  def all
    @relation.public_send(filter_by, filter_value)
  end

  private
  def filter_by
    @params[:filter_by].presence_in(FILTER_RENT_OPTIONS) || :filter_by_status
  end

  def filter_value
    @params[:filter_value].present? ? @params[:filter_value] : nil
  end

end
