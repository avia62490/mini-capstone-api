class CartedProductsController < ApplicationController
  before_action :authenticate_user
  def create
    carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: 10,
      quantity: 6,
      status: "In cart"
    )
    carted_product.save
    render json: carted_product.as_json
  end
end
