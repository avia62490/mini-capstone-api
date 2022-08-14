class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    orders = current_user.orders
    render json: orders.as_json
  end

  def show
    @order = current_user.orders[params[:id].to_i - 1]
    render template: "orders/show"
    # render json: @order.as_json
  end

  def create
    carted_products = CartedProduct.where(user_id: current_user.id, status: "In cart")

    #Get Price values
    order_subtotal = 0
    carted_products.each do |cp|
      cost_of_product = cp.product.price * cp.quantity
      order_subtotal += cost_of_product
    end
    order_tax = order_subtotal * 0.09
    order_total = order_subtotal + order_tax

    #Create order
    order = Order.new(
    user_id: current_user.id,
    sub_total: order_subtotal,
    tax: order_tax,
    total: order_total
    )
    order.save

    #Update Carted Products
    carted_products.each do |cp|
      cp.order_id = order.id
      cp.status = "Purchased"
      cp.save
    end
    render json: order.as_json
  end
end
