class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])

		@comment = @post.comments.create!(comment_params)

		if @comment.errors.any?
			render "posts/show"
		else
			redirect_to @post
		end
	end


	private


	def comment_params
		@comment_params ||= params.require(:comment).permit(:body)
	end

end