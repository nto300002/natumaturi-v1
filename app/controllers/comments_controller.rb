class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to @comment.flyer, notice: 'Comment was successfully created.'
    else
      redirect_to @comment.flyer, alert: 'Comment failed to post.'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @comment.flyer, notice: 'Comment was successfully destroyed.'
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :flyer_id)
  end
end
