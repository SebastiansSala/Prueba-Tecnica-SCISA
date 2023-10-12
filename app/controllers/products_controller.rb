class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]
  before_action :set_product, only: [:show, :update, :destroy]

  def index
    category = Category.find(params[:category_id])
    products = category.products.all
    render json: products
  end

  def show
    @category = Category.find(params[:category_id])
    @product = @category.products.find(params[:id])
    if @product
      render json: @product
    else
      render json: {error: "Product not found"}
    end
    
  end

  def create
    @category = Category.find(params[:category_id])
    @product = @category.products.new(product_params)
    if @product.save
      render json: {message: "Product created", product: @product}
    else
      render json: {error: "Product not created"}
    end
  end

  def update
    @category = Category.find(params[:category_id])
    @product = @category.products.find(params[:id])
    if @product.update(product_params)
      render json: {message: "Product updated", product: @product}
    else
      render json: {error: "Product not updated"}
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @product = @category.products.find(params[:id])

    @product.destroy
    render json: {message: "Product deleted", product: @product}
  end

  private 
    def set_product 
      @product = Product.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to categories_path
    end

    def product_params
      params.require(:product).permit(:name, :description)
    end
end
