class PostsController < ApplicationController
  
  def index
    @post = Post.all
    @category = Category.all.order("id ASC").limit(13)
  end

  def new
    @post = Post.new
    @parents = Category.all.order("id ASC").limit(13)
    @post.build_shipment
    @post.build_brand
  end

  def create
      @post = Post.new(post_params)
      if @post.save!
       shipment_id = Shipment.find(@post.id)
       post = Post.find(@post.id)
       post.update(shipment_id: shipment_id)
       redirect_to root_path
      else
       redirect_to new_post_path
      end
    end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params) 
      redirect_to mypage_path
    else
      redirect_to edit_post_path
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy
      redirect_to mypage_path
    else
      redirect_to mypage_path
    end
  end

  def show
    @post = Post.find(params[:id])
    @category = Category.find(@post.category)
    @area = Area.find(@post.shipment.ship_from)
  end

  def search
    @posts = Post.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json do
       @children = Category.find(params[:parent_id]).children
      end
    end
  end

  private
    def post_params
      params.require(:post).permit(:name, :description, :category, :size, :price, :status, 
      shipment_attributes: [:id, :delivery_fee, :shipping_method, :ship_from, :ship_days],images: [], 
      brand_attributes: [:id, :brand], category_ids: []).merge(seller_id: current_user.id)
    end

end