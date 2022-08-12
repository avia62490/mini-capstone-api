class OrdersController < ApplicationController
  before_action :authenticate_user

  def show
    @order = Order.find_by(id: params[:id])
    # render template: "orders/show"
    render json: @order.as_json
  end

  def create
    carted_products = CartedProduct.where(user_id: current_user.id, status: "In cart")
    order_subtotal = 0
    carted_products.each do |cp|
      cost_of_product = cp.product.price * cp.quantity
      order_subtotal += cost_of_product
    end
    order_tax = order_subtotal * 0.09
    order_total = order_subtotal + order_tax
    order = Order.new(
    user_id: current_user.id,
    sub_total: order_subtotal,
    tax: order_tax,
    total: order_total
    )
    render json: order.as_json
  end
end
