class V1::RentsController < ApplicationController
  before_action -> { doorkeeper_authorize! :public}
  before_action :set_rent, only: [:show, :destroy, :return]

  # GET /v1/rents
  def index
    page = params[:page] rescue 1
    @rents = OrderedRentsQuery.new(sort_query_params, filtered_rents).all.page(page)

    render json: @rents
  end

  # GET /v1/rents/1
  def show
    render json: @rent
  end

  # POST /v1/rents
  def create
    @rent = current_resource_owner.rents.new(rent_params)

    # binding.pry

    if @rent.save
      render json: @rent, status: :created, location: @rent
    else
      render json: @rent.errors, status: :unprocessable_entity
    end
  end

  def return
    @rent.return_rental! if (@rent.pending? or @rent.late?)
    render json: @rent
  end

  private
    def filtered_rents
      if params[:filter_by] and params[:filter_value]
        FilterRentsQuery.new(filter_query_params, current_resource_owner.rents).all
      else
        current_resource_owner.rents
      end
    end

    def sort_query_params
      params.slice(:sort_by, :direction)
    end

    def filter_query_params
      params.slice(:filter_by, :filter_value)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_rent
      @rent = current_resource_owner.rents.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def rent_params
      params.require(:rent).permit(:user_id, :rental_end_date, movie_rents_attributes: [ :id, :movie_id, :quantity ])
    end
end
