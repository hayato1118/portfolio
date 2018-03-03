class ProductGoodsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @product_good = ProductGood.new(
    product_id: params[:product_id],
    user_id: current_user.id
    )
      if @product_good.save
          redirect_to product_path(@product)
      else
          render template: 'products/show'
      end
  end

  def destroy
    @product_good = ProductGood.find_by(product_id: params[:product_id], user_id: current_user.id)
    @product_good.destroy
    redirect_to product_path(params[:product_id])
  end


  private
    def product_good_params
      params.require(:product_good).permit(:product_id, :user_id)
    end
end
