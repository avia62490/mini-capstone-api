class ProductsController < ApplicationController

  def display_products
    render json: Product.all
  end

  def display_computer
    render json: Product.find_by(name: "computer")
  end

  def display_bicycle
    render json: Product.find_by(name: "bicycle")
  end

  def display_phone
    render json: Product.find_by(name: "phone")
  end

end
