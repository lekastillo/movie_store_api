class SearchMoviesQuery
  def initialize(params = {}, relation = Movie)
    @relation = relation
    @params = params
  end

  def all
    @params[:q].present? ? @relation.search(@params[:q]) : @relation
  end

end
