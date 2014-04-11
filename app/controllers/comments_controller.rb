class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create!(params[:comment_params])
		if @comment.errors.any?
			render "posts/show"
		else
			redirect_to @post
		end
	end
end