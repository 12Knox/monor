class ProductsController < ApplicationController

before_action :authenticate_user!, only: :new


  # def products
  #   @products = Product.order("created_at DESC").page(params[:page])
  # end

  def new
  end

  def create
    Product.create(products_name: product_params[:products_name], price: product_params[:price], image: product_params[:image], concept: product_params[:concept], user_id: current_user.id)
  end

  def destroy
      product = Product.find(params[:id])
      if product.user_id == current_user.id
        product.destroy
      end
    end

  private
    def product_params
      params.permit(:products_name, :price, :image, :concept)
    end

  def move_to_index
      redirect_to action: :index unless user_signed_in?
    end

end
