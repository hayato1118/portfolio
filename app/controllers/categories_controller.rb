class CategoriesController < ApplicationController

  # def create
  #   # セッションで管理しており、current_userでログイン中のユーザーを管理
  #   @user = current_user
  #   # ログイン中のユーザーにプロジェクト情報を追加
  #   @category = @user.categories.new(params_category)
  #   respond_to do |format|
  #     if @user.save
  #       # DB保存成功時の処理
  #       format.html { redirect_to @category, notice: 'category was successfully created.' }
  #     else
  #       # DB保存失敗時の処理
  #       format.html { render :new }
  #     end
  #   end
  # end

  # private

  # def params_category
  #   params.require(:category).permit(:category_name)
  # end

  # # 簡易的に最初のユーザーをログイン中のユーザーと見なす
  # def current_user
  #   User.first
  # end
end

