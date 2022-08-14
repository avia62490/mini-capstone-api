class CartedProductsController < ApplicationController
  before_action :authenticate_user

  def create
    carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "In cart"
    )
    carted_product.save
    render json: carted_product.as_json
  end

  def index
    @carted_products = CartedProduct.where(user_id: current_user.id, status: "In cart")
    render template: "carted_products/index"
    # render json: carted_products.as_json
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.status = "Removed" 
    carted_product.save
    render json: {message: "Item removed from shopping cart"}
  end
end
