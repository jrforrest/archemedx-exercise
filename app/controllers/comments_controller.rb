class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    flash[:notice] = "Comment created!"
    redirect_to :back
  end

  # Soft-deletes a comment, rather than outright destroying it
  def destroy
    Comment.find(params[:id]).soft_delete
    flash[:notice] = 'Comment deleted.  Do note that its still in our '\
      'system, but other users can\'t read it'
    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :parent_type, :parent_id)
  end

  def parent
    params[:nested] == '1' ? post : parent_comment
  end

  def parent_comment
    @parent_comment ||= Comment.find(params[:comment][:parent_id])
  end

  def post
    @post ||= Post.find(params[:comment][:parent_id])
  end
end
