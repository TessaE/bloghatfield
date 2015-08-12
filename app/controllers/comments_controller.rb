class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
		if @comment.errors.any?
			respond_to do |format|
				render "posts/show"
			end
		else
  			respond_to do |format|
				format.html { redirect_to @post }
				format.js
			end
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
		@comment.destroy

		respond_to do |format|
			format.html { redirect_to @post }
			format.js
		end
	end

	private

	def comment_params
	    params.require(:comment).permit(:body)
	end
end
