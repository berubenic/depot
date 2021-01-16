class StoreController < ApplicationController
    include CurrentCart
    before_action :set_cart
    before_action :set_view_count, only: [:index]
    def index
        @products = Product.order(:tile)
    end

    private

    def set_view_count
        @view_count = session[:counter]
        if session[:counter]
            session[:counter] += 1
        else
            session[:counter] = 1
        end
    end
end
