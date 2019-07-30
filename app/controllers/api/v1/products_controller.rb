class Api::V1::ProductsController < ApplicationController
    before_action :user_auth , only: :add_cart
    def show
        @product = Product.find_by(barcode: params[:id])
        render json: @product
    end

    def add_cart
        @product = Product.find(params[:id])
        #quantity
        CartProuct.create(product_id: @product.id, cart_id: @user.cart.id,quantity: params[:quantity]) 
        render json: {sucess: true}, status: :ok
    end
end
