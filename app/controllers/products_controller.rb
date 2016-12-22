class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :destroy, :update]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = @current_user.products.new(product_params)
    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: "Product updated"
    else
      render :new, alert: @product.errors
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url
  end

  private

  def product_params
    params.require(:product).permit(:title, :price, :description, :image)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
