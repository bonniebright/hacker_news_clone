class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
      if @post.save
        flash[:notice] = "Post Created."
        redirect_to('/posts')
      else
        render 'new'
      end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
      if @post.update_attributes(post_params)
        flash[:notice] =  "Post Updated."
        redirect_to ('/posts')
      else
        render 'edit'
      end
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to('/posts')
  end

private
  def post_params
    params.require(:post).permit(:post, :link, :votes)
  end
end
