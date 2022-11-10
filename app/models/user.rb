class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise機能
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # プロフィール画像
  has_one_attached :image
  # アソシエーション記述
  has_many :theaters 
  has_many :theater_comments
  has_many :favorites
  # ゲストログイン機能
  def self.guest
      find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "御客様"
      user.kana_name = "ゲスト"
      # user.skip_confirmation!  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
      end
  end
end