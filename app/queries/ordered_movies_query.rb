class OrderedMoviesQuery
  SORT_OPTIONS = %w(by_title by_popularity).freeze

  def initialize(params = {}, relation = Movie)
    @relation = relation
    @params = params
  end

  def all
    @relation.public_send(sort_by, direction)
  end

  private
  def sort_by
    @params[:sort].presence_in(SORT_OPTIONS) || :by_title
  end

  def direction
    @params[:direction] == "asc" ? :asc : :desc
  end

end
