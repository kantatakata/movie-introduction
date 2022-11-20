class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise機能
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # プロフィール画像
  has_one_attached :profile_image
  # アソシエーション記述
  has_many :theaters
  has_many :theater_comments
  has_many :favorites

  # バリデーション
     validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
     validates :kana_name, length: { minimum: 2, maximum: 20 }, uniqueness: true


  # ゲストログイン機能
  def self.guest
      find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.name = "御客様"
      customer.kana_name = "ゲスト"
      # user.skip_confirmation!  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
      end
  end

  # プロフィール画像導入
  def get_profile_image
  (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end

  # 検索機能
  def self.search_for(content, method)
    if method == 'perfect'
      Customer.where(name: content)
    elsif method == 'forward'
      Customer.where('name LIKE ?', content+'%')
    elsif method == 'backward'
      Customer.where('name LIKE ?', '%'+content)
    else
      Customer.where('name LIKE ?', '%'+content+'%')
    end
  end
  # 退会機能
  # is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_deleted == false)
  end
end