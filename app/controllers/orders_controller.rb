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
    if current_user
      @order = Order.new(user_id: 2, product_id: 2, quantity: 1)
      @order.save
      # render json: {measd: "order saved"}
      render template: "orders/show"
    else
      render json: {messGE: "Must log in"}
    end
  end
end
