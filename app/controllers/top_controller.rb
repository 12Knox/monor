class TopController < ApplicationController

  def index
    @products = Product.includes(:user).page(params[:page]).order("created_at DESC")
    # @q = Product.ransack(params[:q])
    # @products = @q.result
  end

  def nickname
    @nickname = Nickname.find(params[:nickname])
  end

  def new
  end

  def create
    Product.create(products_name: product_params[:products_name], nickname: product_params[:nickname], price: product_params[:price], image: product_params[:image], concept: product_params[:concept], user_id: current_user.id)
  end

  private
    def product_params
      params.permit(:products_name, :nickname, :price, :image, :concept)
    end

  def move_to_index
      redirect_to action: :index unless user_signed_in?
    end

end
