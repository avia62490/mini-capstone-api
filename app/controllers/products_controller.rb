class ProductsController < ApplicationController

def index
  render json: Product.all
end

def show
  render json: Product.find_by(id: params[:id])
end


end
