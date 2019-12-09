class BuyOrderConfirmationsController < ApplicationController
  
 
  def show
    @post = Post.find(params[:id])
  end
end
