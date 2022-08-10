class ProductsController < ApplicationController
before_action :authenticate_admin, only: [:create, :update, :destroy]

def index
  p "="*99
  p "All the Products"
  p "="*99
  products = Product.all
  render json: products.as_json
end

def show
  p "="*99
  p "A Specific Product"
  p "="*99
  @product = Product.find_by(id: params[:id])
  render template: "products/show"
end

def create
  p "="*99
  p "Product Created"
  p "="*99
  @product = Product.new(
  name: params[:name],
  price: params[:price],
  description: params[:description]
  )
  if @product.save
    render template: "products/show"
  else
    render json: @product.errors.full_messages, status: :unprocessable_entity
  end
end

def update
  p "="*99
  p "Product Updated"
  p "="*99
  
  @product = Product.find_by(id: params[:id])

  @product.name = params[:name] || @product.name
  @product.price = params[:price] || @product.price
  @product.description = params[:description] || @product.description
  if @product.save
    render template: "products/show"
  else
    render json: @product.errors.full_messages, status: :unprocessable_entity
  end
end

def destroy
  p "="*99
  p "Product DESTROYED!!!"
  p "="*99
  @product = Product.find_by(id: params[:id])
  @product.destroy
  render template: "products/show"
end



end
