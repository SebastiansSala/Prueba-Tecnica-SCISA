class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products/:id
  def show
    @category = Category.find(params[:category_id])
    @product = @category.products.find(params[:id])
    render 'products/show'
  end

  # GET /products/new
  def new
    @category = Category.find(params[:category_id])
    @product = @category.products.build
  end

  # GET /products/:id/edit
  def edit
    @category = Category.find(params[:category_id])
    @product = @category.products.find(params[:id])
    render 'products/edit'
  end

  # POST /products
  def create
    @category = Category.find(params[:category_id])
    @product = @category.products.new(product_params)
    if @product.save
      redirect_to @category
    else
      render :new
    end
  end

  # PATCH/PUT /products/id
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit
    end
  end

  # DELETE /products/:id
  def destroy
    @category = Category.find(params[:category_id])
    @product = @category.products.find(params[:id])

    if @product.destroy
      redirect_to products_url, notice: 'Product successfully removed'
    else
      redirect_to products_url, notice: 'Product could not be destroyed'
    end
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
