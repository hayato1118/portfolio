class MypageCommentsController < ApplicationController

 	def create
 		# binding.pry
	    @mypage_comment = MypageComment.new(mypage_comment_params)
	    # どのユーザーに送ったか？
	    @mypage_comment.to_user_id = current_user.id
	    # どのユーザーからもらったか？
	    @mypage_comment.from_user_id = params[:mypage_comment][:from_user_id]
        @mypage_comment.save
        redirect_to root_path
    	end




	 private
		def mypage_comment_params
			params.require(:mypage_comment).permit(:comment,:to_user_id,:from_user_id)
		end


end