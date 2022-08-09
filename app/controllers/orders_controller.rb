class OrdersController < ApplicationController

  def create
    p "=" * 99
    p "ORDER CREATED"
    p "=" * 99
    if current_user
      product = Product.find_by(id: params[:product_id])
      render json: product.as_json
    else
      render json: {messGE: "Must log in"}
    end
  end
end
