class StoreController < ApplicationController
    before_action :set_view_count, only: [:index]
    def index
        @products = Product.order(:tile)
    end

    private

    def set_view_count
        @view_count = session[:counter]
        if session[:counter].nil?
            session[:counter] = 1
        else
            session[:counter] += 1
        end
    end
end
