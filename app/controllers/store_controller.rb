class StoreController < ApplicationController
  def index
      @products = Product.order(:tile)
  end
end
