class Admin::CategoriesController < ApplicationController
  respond_to :html

  def index
    @categories = Category.all

    respond_with @categories
  end

  def show
    @category = Category.find(params[:id])

    respond_with @category
  end

  def new
    @category = Category.new

    respond_with @category
  end

  def edit
    @category = Category.find(params[:id])

    respond_with @category
  end

  def update
    @category = Category.find(params[:id])
    @category.attributes = params[:category]

    if @category.save
      redirect_to admin_category_path(@category), :notice => 'The category was successfully updated.'
    else
      flash.now[:error] = 'There was a problem updating the category.'
      render :edit
    end
  end

  def create
    @category = Category.new(params[:category])

    if @category.save
      redirect_to admin_category_path(@category), :notice => 'The category was successfully added.'
    else
      flash.now[:error] = 'There was a problem adding the category.'
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])

    if @category.delete
      redirect_to admin_categories_path, :notice => 'The category was successfully deleted.'
    else
      flash[:error] = 'There was a problem deleting the category.'
      redirect_to admin_categories_path
    end
  end
end
