class ProductsController < ApplicationController

def index
  render json: Product.all
end

def show
  render json: Product.find_by(id: params[:id])
end

def create
  product = Product.new(
  name: params[:name],
  price: params[:price],
  image_url: params[:image_url],
  description: params[:description]
  )
  product.save
  render json: product.as_json
end

def update
  p "working here too"
  product = Product.find_by(id: params[:id])
  product.name = params[:name]
  product.price = params[:price]
  product.image_url = params[:image_url]
  product.description = params[:description]
  product.save
  render json: product.as_json
end



end
