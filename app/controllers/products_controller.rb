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

  def display_by_index
    p "=" *99
    p params["id"]
    p "=" *99
  
    render json: Product.find_by(id: params[:id])
  end

end
