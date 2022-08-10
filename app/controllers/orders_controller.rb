class OrdersController < ApplicationController
  before_action :authenticate_user

  def show
    @order = Order.find_by(id: params[:id])
    render template: "orders/show"
  end

  def create
    p "=" * 99
    p "ORDER CREATED"
    p "=" * 99
    product = Product.find_by(id: params[:product_id])
    price = product.price
    order_subtotal = params[:quantity].to_i * price
    order_tax = order_subtotal * 0.09
    order_total = order_subtotal + order_tax

    @order = Order.new(
    user_id: current_user.id, 
    product_id: product.id, 
    quantity: params[:quantity],
    sub_total: order_subtotal,
    tax: order_tax,
    total: order_total
    )
    @order.save
    render json: @order.as_json
    # render template: "orders/show"
  end
end
