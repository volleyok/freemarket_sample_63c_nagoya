class PostsController < ApplicationController
  
  def index
    @post = Post.all
  end

  def new
    @post = Post.new
    # @parents = Category.all.order("id ASC").limit(13)
    @parents = Category.all.order("id ASC").limit(13)
    @post.build_shipment
    @post.build_brand
  end

  def create
      @post = Post.new(post_params)
      # Post.create(post_params)
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
    post.update(post_params) 
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy  
  end

  def show
    @post = Post.find(params[:id])
    @category = Category.find(@post.category)
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
      shipment_attributes: [:id, :delivery_fee, :shipping_method, :ship_from, :ship_days],
      brand_attributes: [:id, :brand], category_ids: []).merge(seller_id: current_user.id)
    end

end

# ,images: [], 