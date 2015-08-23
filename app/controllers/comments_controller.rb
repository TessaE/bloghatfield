class CommentsController < ApplicationController
	
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
		
		if @comment.save
  			respond_to do |format|
				format.html { redirect_to @post }
				format.js
			end
		else
			respond_to do |format|
				format.html { redirect_to @post, notice: 'Geef een naam en reactie' }
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
	    params.require(:comment).permit(:name, :body)
	end
end
