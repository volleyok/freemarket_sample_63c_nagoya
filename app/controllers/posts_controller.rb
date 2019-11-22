class PostsController < ApplicationController
  
  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params) 
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy  
  end

  def show
   @post = Post.find(params[:id])
  end

  private
def post_params
  params.require(:post).permit(:name, :description, :cotegory, :brand, :status, :postage, :ship_from, :shipping_date, :price).merge(user_id: current_user.id)
end

end
