class ProductCommentsController < ApplicationController
def create
    product = Product.find(params[:product_id])
    comment = current_user.product_comments.new(product_comment_params)
    comment.product_id = product.id
    if comment.save
      redirect_to product_path(product)
    else
      redirect_to product_path(product), flash: { error: comment.errors.full_messages }
    end
end

private
def product_comment_params
  params.require(:product_comment).permit(:user_id,:product_id,:comment)
end
end
