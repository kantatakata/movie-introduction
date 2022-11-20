class Theater < ApplicationRecord

  has_many :theater_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :user
  belongs_to :genre
  
  validates :title,presence:true
  # validates :genre_id,presence:true
  validates :introduction,presence:true,length:{maximum:200}
  
  # いいね機能
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  # 映画タイトル検索機能
  def self.search_for(content, method)
    if method == 'perfect'
      Theater.where(title: content)
    elsif method == 'forward'
      Theeter.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Theater.where('title LIKE ?', '%'+content)
    else
      Theater.where('title LIKE ?', '%'+content+'%')
    end
  end
end
