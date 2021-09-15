class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

          
  with_options presence: true do
    validates :nickname , length: {maximum: 25}
    validates :account_name , length: {minimum: 4 , maximum: 25} , format: {with: /\A[a-zA-Z0-9]+\z/ , message: "英数字のみが使えます"}
  end
  validates :account_name , uniqueness: true , on: :update
  validates :explain , length: {maximum: 1000}
  has_many :sns_credentials , dependent: :destroy
  has_many :stickman_war_comments , dependent: :destroy
  has_many :requests , dependent: :destroy
  has_many :movie_comments
  has_many :group_user_relations 
  has_many :groups , through: :group_user_relations
  has_many :messages
  has_one_attached :icon_image
  has_one_attached :background_image
  
  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider , uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name , 
      email: auth.info.email
    )
    if user.persisted?
      sns.user = user
      sns.save
    end
    user
  end
end
