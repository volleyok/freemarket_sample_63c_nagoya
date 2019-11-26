class MypagesController < ApplicationController
  def index
    @user = User.find(current_user.id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def delete
  end

  def show
    @post = Post.where(user_id: current_user.id)
  end
end
