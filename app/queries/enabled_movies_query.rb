class EnabledMoviesQuery
  SORT_OPTIONS = %w(by_title by_popularity).freeze

  def initialize(relation = Movie)
    @relation = relation
  end

  def all
    @relation.available
  end

end
