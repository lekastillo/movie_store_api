class V1::PurchasesController < ApplicationController
  before_action -> { doorkeeper_authorize! :public}
  before_action :set_purchase, only: [:show, :destroy]

  # GET /v1/purchases
  def index
    page = params[:page] rescue 1
    @purchases = current_resource_owner.purchases.all.page(page)

    render json: @purchases
  end

  # GET /v1/purchases/1
  def show
    render json: @purchase
  end

  # POST /v1/purchases
  def create
    @purchase = current_resource_owner.purchases.new(purchase_params)

    # binding.pry

    if @purchase.save
      render json: @purchase, status: :created, location: @purchase
    else
      render json: @purchase.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = current_resource_owner.purchases.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def purchase_params
      params.require(:purchase).permit(:user_id, movie_purchases_attributes: [ :id, :movie_id, :quantity ])
    end
end
