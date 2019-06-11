class V1::MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :update, :destroy, :enable, :disable]
  # before_action :doorkeeper_authorize!

  before_action -> { doorkeeper_authorize! :public }, only: :index
  before_action only: [:update, :create, :destroy, :enable, :disable] do
    doorkeeper_authorize! :admin
  end

  # GET /movies
  def index
    page = params[:page][:number] rescue 1
    @movies = OrderedMoviesQuery.new(sort_query_params, search_result_movie).all.page(page)

    render json: @movies
  end

  # GET /movies/1
  def show
    render json: @movie
  end

  # POST /movies
  def create
    @movie = Movie.new(movie_params)
    movie_attach_covers

    if @movie.save
      render json: @movie, status: :created, location: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /movies/1
  def update
    if @movie.update(movie_params)
      render json: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # DELETE /movies/1
  def destroy
    @movie.destroy
  end

  # PUT /movies/1/enable
  def enable
    @movie.enable!
    render json: @movie
  end

  # PUT /movies/1/disable
  def disable
    @movie.disable!
    render json: @movie
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def movie_params
      params.require(:movie).permit(:title, :description, :stock, :rental_price, :sale_price, :delayed_return_penalty_amount)
    end

    def sort_query_params
      params.slice(:sort_by, :direction)
    end

    def search_query_params
      params.slice(:q)
    end

    def available_movies
      EnabledMoviesQuery.new().all
    end

    def search_result_movie
      SearchMoviesQuery.new(search_query_params, available_movies).all
    end

    def cover_name
      params[:movie][:file_name]
    end

    def movie_attach_covers
      params[:movie][:covers] & params[:movie][:covers].each do |cover|

        decoded_image = Base64.decode64(cover[:cover])
        string_image_decoded = StringIO.new(decoded_image)
        @movie.covers.attach(io: string_image_decoded, filename: cover[:file_name])
      end
    end
end
