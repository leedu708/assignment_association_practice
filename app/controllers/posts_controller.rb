class PostsController < ApplicationController

  def index

    @post = Post.all

  end

  def show

    @post = Post.find(params[:id])

  end

  def edit

    @post = Post.find(params[:id])
    @category_selection = Category.all.map { |c| [c.name, c.id] }

  end

  def new

    @post = Post.new
    @category_selection = Category.all.map { |c| [c.name, c.id] }

  end

  def create

    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Post saved successfully!"
      redirect_to posts_path
    else
      flash.now[:danger] = "Post failed to save - please try again."
      render :new
    end

  end

  def update

    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Post updated successfully!"
      redirect_to posts_path
    else
      flash.now[:danger] = "Post failed to update - please try again."
      render :edit
    end

  end

  def destroy

    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = "Post deleted successfully!"
      redirect_to posts_path
    else
      flash[:danger] = "Post failed to be deleted - please try again."
      redirect_to :back
    end

  end

  def post_params

    params.require(:post).permit(:title, :body, :category_id, :tag_ids => [])

  end

end
