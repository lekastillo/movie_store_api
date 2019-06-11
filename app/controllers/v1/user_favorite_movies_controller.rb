class V1::UserFavoriteMoviesController < ApplicationController
  before_action :doorkeeper_authorize!
  before_action :set_user_favorite_movie, only: [:show, :update, :destroy]
  # GET /v1/user_favorite_movies
  def index
    page = params[:page][:number] rescue 1
    @user_favorite_movies = current_resource_owner.user_favorite_movies.all.page(page)

    render json: @user_favorite_movies
  end

  # GET /v1/user_favorite_movies/1
  def show
    render json: @user_favorite_movie
  end

  # POST /v1/user_favorite_movies
  def create
    @user_favorite_movie = current_resource_owner.user_favorite_movies.new(user_favorite_movie_params)

    if @user_favorite_movie.save
      render json: @user_favorite_movie, status: :created, location: @user_favorite_movie
    else
      render json: @user_favorite_movie.errors, status: :unprocessable_entity
    end
  end

  # DELETE /v1/user_favorite_movies/1
  def destroy
    @user_favorite_movie.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_favorite_movie
      @user_favorite_movie = current_resource_owner.user_favorite_movies.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_favorite_movie_params
      params.require(:user_favorite_movie).permit(:movie_id)
    end
end
