class OrdersController < ApplicationController

  def create
    p "=" * 99
    p "ORDER CREATED"
    p "=" * 99
    if current_user
      @order = Order.new(user_id: 1, product_id: 1, quantity: 1)
      @order.save
      # render json: {measd: "order saved"}
      render template: "orders/show"
    else
      render json: {messGE: "Must log in"}
    end
  end
end
