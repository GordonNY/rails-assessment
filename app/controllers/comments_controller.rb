class CommentsController < ApplicationController
	def create
		
		@comment = Comment.new(comment_params)
		post = Post.find(params[:post_id])
    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(post), notice: 'comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to post_path(post) }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
	end

	private
	def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
