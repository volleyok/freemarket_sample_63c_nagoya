class BuyOrderConfirmationsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
 
  def show
    @post = Post.find(params[:id])
  end
end
