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
    @order = Order.new(
    user_id: current_user.id, 
    product_id: params[:product_id], 
    quantity: params[:quantity]
    )
    @order.save
    # render json: @order.as_json
    render template: "orders/show"
  end
end
