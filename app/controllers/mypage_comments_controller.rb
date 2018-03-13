class MypageCommentsController < ApplicationController

 	def create
	    @mypage_comment = MypageComment.new(mypage_comment_params)
	    # どのユーザーに送ったか？
	    @mypage_comment.to_user_id = current_user.id
	    # どのユーザーからもらったか？
	    @mypage_comment.from_user_id = params[:mypage_comment][:from_user_id]
        @mypage_comment.save
        redirect_to user_path(@mypage_comment.from_user_id)
    end



		# def destroy
		# 	@user = User.find(params[:to_user_id])
		# 	@mypage_comment = @user.mypage_comments.find(params[:id])
		# 	@mypage_comment.destroy
		# 	redirect_to user_path(@user)
		# end


 private
	def mypage_comment_params
		params.require(:mypage_comment).permit(:comment,:to_user_id,:from_user_id)
	end
end