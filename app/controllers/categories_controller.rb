class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update, :destroy]

    def index
        @categories = Category.all

        render 'categories/index'
    end

    def show 
    end

    def new
        @category = Category.new
    end

    def edit
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            redirect_to @category, notice: 'Category successfully created'
        else
            render :new
        end
    end

    def update
        if @category.update(category_params)
            redirect_to @category, notice: 'Category successfully updated'
        else
            render :edit
        end
    end

    def destroy
        if @category.products.count > 0
            redirect_to @category, notice: 'Category has products. Delete products first'
            return
        end
        @category.destroy
        redirect_to categories_url, notice: 'Category successfully destroyed'
    end

    def set_category
        @category = Category.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to categories_path, alert: 'Category not found'
    end

    def category_params
        params.require(:category).permit(:name, :description)
    end
end

