class FavoritesController < ApplicationController

def create
    @user_id = current_user.id #ログインしたユーザのID
    @product_id = Product.find(params[:id]).id #特定の本のID
    #product_idに@product_id、user_idに@user_idを入れて、Favoriteモデルに新しいオブジェクトを作る
    @favorite = Favorite.new(product_id: @product_id, user_id: @user_id)
    if @favorite.save
      #保存に成功した場合、本一覧画面に戻る
      redirect_to products_path
    else
    	# logger.info(@favorite.errors.full_messages)
    end
  end

  #お気に入り削除用アクション
  def destroy
    @favorite = Favorite.find(params[:id])
    if @favorite.destroy
      #削除に成功した場合、ログインしているユーザの詳細画面に戻る
      redirect_to user_path(current_user.id)
  end
end
end