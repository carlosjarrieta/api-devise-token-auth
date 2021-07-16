class Api::V1::ProductsController < ApplicationController
  before_action :authenticate_api_v1_user!

  def index
    if params[:page]
      @products = Product.order(created_at: :desc).page(params[:page])
    else
      @products = Product.order(created_at: :desc)
    end

    render json: { products: @products, meta: { all_records: Product.count, paginates_records: @products.count } }
  end
end
