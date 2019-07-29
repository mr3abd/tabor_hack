class Api::V1::ProductsController < ApplicationController
    def show
        @product = Product.find_by(barcode: params[:id])
        render json: @product
    end
end
