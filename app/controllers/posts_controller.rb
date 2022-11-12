class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to posts_path, notice: "投稿しました！"
    else
      render :new
    end
  end

  def edit
    set_post
  end

  def update
    set_post
    if @post.update(post_params)
      redirect_to posts_path, notice: "編集しました"
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
