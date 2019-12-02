class SignupsController < ApplicationController
  def index
  end
  def show
  end
  def new
    @user = User.new
  end
  def phone
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:lastname] = user_params[:lastname]
    session[:firstname] = user_params[:firstname]
    session[:lastname_kana] = user_params[:lastname_kana]
    session[:firstname_kana] = user_params[:firstname_kana]
    session[:birthday] = user_params[:birthday]
    
    @user = User.new
  end
  def address
    session[:phone_number] = user_params[:phone_number]
    @user = User.new
  end
  def check
    session[:postal_code] = user_params[:postal_code]
    session[:prefecture] = user_params[:prefecture]
    session[:city] = user_params[:city]
    session[:address] = user_params[:address]
    session[:building_name] = user_params[:building_name]
    session[:phone_number] = user_params[:phone_number]
    @user = User.new
  end
  def complete
    @user = User.new
  end
  def done
    @user = User.new(
    nickname: session[:nickname],
    email: session[:email],
    password: session[:password],
    lastname: session[:lastname],
    firstname: session[:firstname],
    lastname_kana: session[:lastname_kana],
    firstname_kana: session[:firstname_kana],
    birthday: session[:birthday],
    phone_number: session[:phone_number],
    postal_code: session[:postal_code],
    prefecture: session[:prefecture],
    city: session[:city],
    address: session[:address],
    building_name: session[:building_name],
    phone_number: session[:phone_number],
    )
 
    if @user.save
      # ログインするための情報を保管
      session[:id] = @user.id
      sign_in User.find(session[:id]) unless user_signed_in?
      redirect_to root_path
    else
      render'signups/new'
    end
  end
  
  private
    def user_params
      params.require(:user).permit(
        :nickname,
        :email,
        :password,
        :lastname,
        :firstname,
        :lastname_kana,
        :firstname_kana,
        :birthday,
        :phone_number,
        :postal_code,
        :prefecture,
        :city,
        :address,
        :building_name,
        :phone_number,
          )
    end

    
    def set_user
      @user = User.new
    end

    
end