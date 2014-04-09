class CommentsController < ApplicationController
  def index
    @comments = @post.comments

  end
  def show
    @comments = @post.comments
  end

  def new
    @comment = Comment.new
  end

  def create
      @comment = Comment.new(comment_params)
      if @comment.save
        flash[:notice] = "Comment saved"
        @post = Post.find_by_id(@comment[:post_id])
        redirect_to post_path(@post)
      else
        render 'new'
      end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :post_id)
  end

end
