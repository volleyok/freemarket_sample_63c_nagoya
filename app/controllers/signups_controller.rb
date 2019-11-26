class SignupsController < ApplicationController
  before_action :set_user, only: [:create, :new, :phone, :address, :check, :complete ]

  def index
    
  end

  def create,
  end

  def new
  end

  def phone
  end

  def address
  end

  def check
  end

  def complete
  end

  def done
    # sign_in User.find(session[:id]) unless user_signed_in?
  end

  private

    def user_params
      params.require(:user).permit(

      )     
    end

    def set_user
      @user = User.new
    end


end
