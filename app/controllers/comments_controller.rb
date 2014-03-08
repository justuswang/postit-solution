class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    # @comment = Comment.new(params.require(:comment).permit(:body))
    # @comment.post = @post
    @comment.user = User.first

    if @comment.save
      flash[:notice] = "Comment was added."
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end
end

#redirect => url
#render => template file