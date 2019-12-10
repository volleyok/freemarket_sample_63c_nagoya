class MypagesController < ApplicationController
  def index
    @user = User.find(current_user.id)
  end

  def post_detail
    @post = Post.find(params[:id])
    @category = Category.find(@post.category)
    @area = Area.find(@post.shipment.ship_from)
  end

  def post_sold
    @post = Post.where('buyer_id IS NOT NULL').all
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def delete
  end

  def profile
  end

  def address
  end

  def card
  end

  def password
  end

  def identification
  end

  def confirmation
  end

  def show
    @post = Post.where(seller_id: current_user.id)
  end
end
