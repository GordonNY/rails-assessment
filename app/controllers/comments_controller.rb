class CommentsController < ApplicationController
	def create
    # byebug
		@comment = Comment.create(comment_params)
		post = Post.find(params[:post_id])

    # respond_to do |format|
      # if @comment.save
      #   # byebug
      #   format.html { redirect_to post_path(post), notice: 'comment was successfully created.' }
      #   format.json { render json: @comment }
      # else
      #   format.html { redirect_to post_path(post) }
      #   format.json { render json: @comment.errors, status: :unprocessable_entity }
      # end
      render json: @comment, status: 201
	end

	private
	def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
