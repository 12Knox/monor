class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_search
  before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_out_path_for(resource)
      root_path
    end

  def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up).push(:nickname, :avatar)
  end

  def set_search
  # @search = Product.search(params[:q])
  @search = Product.ransack(params[:q]) #ransackメソッド推奨
  @search_rides = @search.result.page(params[:page])
end

  end