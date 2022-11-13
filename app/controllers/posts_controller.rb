class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: "DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if params[:back]
      render :new
    else
      if @post.save
        redirect_to posts_path, notice: "投稿しました！"
      else
        render :new
      end
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

  def destroy
    set_post
    @post.destroy
    redirect_to posts_path, notice: "削除しました"
  end

  def confirm
    @post = Post.new(post_params)
    render :new if @post.invalid?
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
