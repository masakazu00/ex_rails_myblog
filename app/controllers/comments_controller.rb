class CommentsController < ApplicationController

  def create
      @post = Post.find(params[:post_id])
      @post.comments.create(commment_params)
      redirect_to post_path(@post)
  end
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
  private
  def commment_params
    params.require(:comment).permit(:body)

  end
end
