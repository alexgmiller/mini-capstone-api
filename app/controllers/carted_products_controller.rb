class CartedProductsController < ApplicationController
    def create
      carted_product = CartedProduct.new(
        product_id: params[:product_id],
        user_id: current_user.id,
        quantity: params[:quantity],
        # order_id: params[:order_id]
        status: "carted"
      )
      carted_product.save
      render json: carted_product
      end
    end

    def index
      carted_product = current_user.carted_products.where(status: "carted")
      render json: carted_product
    end

    def destroy
      carted_product = current_user.carted_products.find(params[:id])
      carted_product.status = "removed"
      carted_product.save
      render json: { message: "Cart updated."}
    end


end
