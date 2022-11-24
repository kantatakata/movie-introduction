class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, authentication_keys: [:email]

  # バリデーション
  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :kana_name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :email, presence: true
  validates :encrypted_password, length: { minimum: 5}
  # 企業IDとメールアドレスでログインをする
  # def self.find_for_database_authentication(warden_conditions)
  #   email = warden_conditions[:email].to_s.downcase.strip
  #   find_by(email: email, organization_id: warden_conditions[:organization_id])
  # end

end
