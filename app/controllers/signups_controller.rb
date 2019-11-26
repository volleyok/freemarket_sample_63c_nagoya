class SignupsController < ApplicationController


  def index
    
  end

  def create
    @user = User.new
  end

  def new
    @user = User.new
  end

  def phone
    @user = User.new
  end

  def address
    @user = User.new
  end

  def check
    @user = User.new
  end

  def complete
    @user = User.new
  end

  def done
    # sign_in User.find(session[:id]) unless user_signed_in?
  end

  private

    def user_params
      params.require(:user).permit(

      )     
    end


end
