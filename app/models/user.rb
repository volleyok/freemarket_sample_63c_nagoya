class User < ApplicationRecord

  has_many :buyed_posts, foreign_key: "buyer_id", class_name: "Post"
  has_many :saling_posts, -> { where("buyer_id is NULL") }, foreign_key: "seller_id", class_name: "Post"
  has_many :sold_posts, -> { where("buyer_id is not NULL") }, foreign_key: "seller_id", class_name: "Post"
  has_many :likes, dependent: :destroy
  has_many :sns_credentials, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # PASSWORD_VALIDATION = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,128}+\z/i
  # step1入力項目
  validates :email,                 presence: true,  on: :validates_step1
  validates :password,              presence: true,   on: :validates_step1
  validates :password_confirmation, presence: true, on: :validates_step1
  validates :nickname,              presence: true, on: :validates_step1
  validates :lastname,              presence: true, on: :validates_step1
  validates :firstname,              presence: true, on: :validates_step1
  validates :lastname_kana,              presence: true, on: :validates_step1
  validates :firstname_kana,              presence: true, on: :validates_step1
  validates :birthday_year,              presence: true, on: :validates_step1
  validates :birthday_month,              presence: true, on: :validates_step1
  validates :birthday_day,              presence: true, on: :validates_step1
  # step2入力項目
  validates :phone_number,              presence: true, on: :validates_step2
  # step3入力項目
  validates :postal_code,              presence: true, on: :validates_step3
  validates :prefecture,              presence: true, on: :validates_step3
  validates :city,              presence: true, on: :validates_step3
  validates :address,              presence: true, on: :validates_step3
  validates :phone_number,              presence: true, on: :validates_step3



  #omniauth_callbacks_controllerで呼び出すメソッド
  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first #firstをつけないとデータが配列で返されて使いたいメソッドが使えなくて困る

    #sns_credentialsが登録されている
    if snscredential.present?
      user = User.where(email: auth.info.email).first

      # userが登録されていない
      unless user.present?
        user = User.new(
        nickname: auth.info.name,
        email: auth.info.email,
        )
      end
      sns = snscredential
      #返り値をハッシュにして扱いやすくする  
      #活用例 info = User.find_oauth(auth) 
             #session[:nickname] = info[:user][:nickname]
      { user: user, sns: sns}

    #sns_credentialsが登録されていない
    else
      user = User.where(email: auth.info.email).first


      # userが登録されている
      if user.present?
        sns = SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
        )

        { user: user, sns: sns}

      # userが登録されていない
      else
        user = User.new(
        nickname: auth.info.name,
        email: auth.info.email,
        )
        sns = SnsCredential.new(
          uid: uid,
          provider: provider
        )

        { user: user, sns: sns}
      end
    end
  end
end
