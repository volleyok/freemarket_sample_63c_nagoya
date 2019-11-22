class MypagesController < ApplicationController
  def index
    @user = User.find(current_user.id)
  end

  def show
    @post = Post.where(user_id: current_user.id)
  end
end
