class SignupsController < ApplicationController
  def index
  end
  def show
  end
  def new
    if session[:password_confirmation]
      @user = User.new(
        #omniauth_callbacks_controllerで定義したsession
        nickname: session[:nickname],
        email: session[:email],
        password: session[:password_confirmation]
      )
    else
      @user = User.new
    end
  end

  def phone
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    if session[:password_confirmation]
      session[:password] = session[:password_confirmation]
    else
      session[:password] = user_params[:password_confirmation]
      session[:password_confirmation] = user_params[:password_confirmation]
    end
    session[:lastname] = user_params[:lastname]
    session[:firstname] = user_params[:firstname]
    session[:lastname_kana] = user_params[:lastname_kana]
    session[:firstname_kana] = user_params[:firstname_kana]
    session[:birthday_year] = user_params[:birthday_year]
    session[:birthday_month] = user_params[:birthday_month]
    session[:birthday_day] = user_params[:birthday_day]
    @user = User.new
  end
  
  def address
    session[:phone_number] = user_params[:phone_number]
    @user = User.new
  end
  # def check
  #   session[:postal_code] = user_params[:postal_code]
  #   session[:prefecture] = user_params[:prefecture]
  #   session[:city] = user_params[:city]
  #   session[:address] = user_params[:address]
  #   session[:building_name] = user_params[:building_name]
  #   session[:phone_number] = user_params[:phone_number]
  #   @user = User.new
  # end
  def complete
    # @user = User.new
  end
  def done
    session[:postal_code] = user_params[:postal_code]
    session[:prefecture] = user_params[:prefecture]
    session[:city] = user_params[:city]
    session[:address] = user_params[:address]
    session[:building_name] = user_params[:building_name]
    session[:phone_number] = user_params[:phone_number]
    @user = User.new(
    nickname: session[:nickname],
    email: session[:email],
    password: session[:password],
    password_confirmation: session[:password_confirmation],
    lastname: session[:lastname],
    firstname: session[:firstname],
    lastname_kana: session[:lastname_kana],
    firstname_kana: session[:firstname_kana],
    birthday_year: session[:birthday_year],
    birthday_month: session[:birthday_month],
    birthday_day: session[:birthday_day],
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
      SnsCredential.create(  #ユーザ登録と同時にこっちも登録
        uid: session[:uid],
        provider: session[:provider],
        user_id: @user.id
      )
      session[:id] = @user.id
      sign_in User.find(session[:id]) unless user_signed_in?
      redirect_to controller: 'card' ,action: 'new'
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
        :password_confirmation,
        :lastname,
        :firstname,
        :lastname_kana,
        :firstname_kana,
        :birthday_year,
        :birthday_month,
        :birthday_day,
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