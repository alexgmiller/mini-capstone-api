class OrdersController < ApplicationController
    before_action :authenticate_user

    def create
        product = Product.find_by(id: params[:product_id])
        calclated_subtotal = product.price * params[:quantity]
        calculated_tax = calculated_subtotal * 0.09
        calculated_total = calculated_subtotal + calculated_tax

        order = Order.new(
            user_id: current_user.id, #inheritence from application controller
            # product_id: params[:product_id],
            # quantity: params[:quantity],
            subtotal: calculated_subtotal,
            tax: calculated_tax,
            total: calculated_total
            )
        order.save
        render json: order.as_json
    end

    def show
        order = current_user.orders.find_by(id: params[:id])
        render json: order
    end

    def index
        orders = current_user.orders
        render json: orders
    end

end
