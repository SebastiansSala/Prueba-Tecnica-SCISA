class CategoriesController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create, :edit, :update, :destroy]
    before_action :set_category, only: [:show, :edit, :update, :destroy]

    def index
        categories = Category.all
        if categories.count == 0
            render json: {error: "No categories found"}
        end
        render json: categories
    end

    def show 
        @category = Category.find(params[:id])
        render json: @category
    end

    def new
        @category = Category.new
    end

    def edit
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            render json: {message: "Category created", category: @category}
        else
            render json: {error: "Category not created"}
        end
    end

    def update
        if @category.update(category_params)
            render json: {message: "Category updated", category: @category}
        else
            render json: {error: "Category not updated"}
        end
    end

    def destroy
        @category = Category.find(params[:id])
        if @category.products.count > 0
            render json: {error: "Cannot delete a category with products"}
        else
            @category.destroy
            render json: {message: "Category deleted", category: @category}
        end
    end

    private 
        def set_category
            @category = Category.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            render json: { error: "Category not found" }, status: :not_found
        end
        
        def category_params
            params.require(:category).permit(:name, :description)
        end
end

