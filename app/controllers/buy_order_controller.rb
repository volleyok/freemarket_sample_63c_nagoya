class BuyOrderController < ApplicationController
  def show
    require "payjp"
    card = Card.where(user_id: current_user.id).first
    @post = Post.find(params[:id])
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    charge = Payjp::Charge.create(
      amount: @post.price,
      customer: card.customer_id,
      currency: 'jpy'
      )
    buy = Post.find(params[:id])
    @buyer = buy.update(buyer_id: current_user.id)
  end
end
