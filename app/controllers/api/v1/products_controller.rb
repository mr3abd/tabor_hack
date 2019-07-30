class Api::V1::ProductsController < ApplicationController
    before_action :user_auth , only: %i[add_cart index checkout]
    def index
        render json: @user.cart.cart_proucts.as_json(include: :product)
    end
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

    def checkout
        # Just send token
        # Create New Checkout 
       @checkout =  Checkout.new(user_id: @user.id )
        if @checkout.save
        #empty cart
        @items_cart = @user.cart.cart_proucts

        @items_cart.each do |item|
            #Create Checkout Items
            @checkout_items = CheckoutProduct.create(product_id: item.product.id, checkout_id: @checkout.id, quantity: item.quantity )
            item.destroy # Delete  empty cart 
        end

        render json: {checkout: @checkout.as_json(includes: :checkout_products), items: @checkout.checkout_products.as_json(include: :product)}
        else
        render json: @checkout.errors, status: :unprocessable_entity
        end
    end
end
