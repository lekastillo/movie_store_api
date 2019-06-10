class EnabledMoviesQuery
  SORT_OPTIONS = %w(by_title by_popularity).freeze

  def initialize()
    @relation = Movie
  end

  def all
    @relation.available
  end

end
