class ProductsController < ApplicationController
    def index
        products = Product.all
        render json: products.as_json
    end

    def show
        input = params["id"]
        product = Product.find_by(id: input)
        render json: product.as_json(methods: [:is_discounted, :tax, :total])
    end

    def create
        product = Product.new(
            name: params["name"],
            price: params["price"],
            image_url: params["image_url"],
            description: params["description"])
        product.save
    end

    def update
        product_id = params[:id]
        product = Product.find_by(id: product_id)

        product.name = params["name"] || product.name
        product.price = params["price"] || product.price
        product.image_url = params["image"] || product.image_url
        product.description = params["description"] || product.description
        product.save
        render json: product.as_json
    end

    def destroy
        product_id = params[:id]
        product = Product.find_by(id: product_id)
        product.destroy
        render json: {message: "Product id: #{product_id} has been deleted."}
    end


    # def first_product
    #     product = Product.first
    #     render json: product.as_json
    # end

    # def second_product
    #     product = Product.second
    #     render json: product.as_json
    # end

    # def third_product
    #     product = Product.third
    #     render json: product.as_json
    # end

end
