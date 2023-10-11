class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def show
    @category = Category.find(params[:category_id])
    @product = @category.products.find(params[:id])
    render 'products/show'
  end

  def new
    @category = Category.find(params[:category_id])
    @product = @category.products.build
  end

  def edit
    @category = Category.find(params[:category_id])
    @product = @category.products.find(params[:id])
  end

  def create
    @category = Category.find(params[:category_id])
    @product = @category.products.new(product_params)
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def update
    @category = Category.find(params[:category_id])
    @product = @category.products.find(params[:id])
    if @product.update(product_params)
      redirect_to 
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @product = @category.products.find(params[:id])

    @product.destroy
    redirect_to @category 
  end

  private 
    def set_product 
      @product = Product.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to products_path, alert: 'Product not found'
    end

    def product_params
      params.require(:product).permit(:name, :description)
    end
end
