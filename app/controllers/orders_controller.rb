class OrdersController < ApplicationController
    def create
        orders = Order.new(
            user_id: params["user_id"],
            product_id: params["product_id"],
            quantity: params["quantity"],
            quantity: params["quantity"])
            subtotal: params["subtotal"]
            tax: params["tax"]
            total: params["total"]
        @orders.save
        render json: @orders.as_json
    end
end
