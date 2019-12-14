class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @post = Post.all.order("created_at DESC")
    @category = Category.all.order("id ASC").limit(13)
    @category = Post.where(category: true)
  end

  def new
    @post = Post.new
    @parents = Category.all.order("id ASC").limit(13)
    @post.build_shipment
    @post.build_brand
    10.times{@post.images.build}
  end

  def create
      @post = Post.new(post_params)
      if @post.save
       shipment_id = Shipment.find(@post.id)
       post = Post.find(@post.id)
       post.update(shipment_id: shipment_id)
       redirect_to root_path
      else 
        @parents = Category.all.order("id ASC").limit(13)
        @post.build_shipment
        @post.build_brand
        10.times{@post.images.build}
       render 'new'
      end
    end

  def edit
    @post = Post.find(params[:id])
    @category_id = @post.category
    @category = Category.find(@category_id)
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
      redirect_to mypage_path
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
    @category = Category.find(@post.category_id)
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

  def category
    @category = Category.all.order("id ASC").limit(13)
    @category_parent = Category.where(ancestry: nil)
  end

  def category_list
    @post = Post.where(category_id:params[:id])
  end

  def pay
    @post = Post.find(params[:id])
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    charge = Payjp::Charge.create(
    amount: @post.price,
    card: params['payjp-token'],
    currency: 'jpy'
    )
  end


  private
    def post_params
      params.require(:post).permit(:name, :description, :category, :size, :price, :status, :category_id,
      shipment_attributes: [:id, :delivery_fee, :shipping_method, :ship_from, :ship_days],
      images_attributes: [:image_url],
      brand_attributes: [:id, :brand]).merge(seller_id: current_user.id)
    end

end