class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :flyers, foreign_key: :user_id
  has_many :comments
  has_many :bookmarks
  has_many :bookmark_flyers, through: :bookmarks, source: :flyer

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
  validates :name, presence: true
  #validates :profile, presence: true
  #validates :sns_account, presence: true
  def own?(resource)
    self.id == resource.user_id
  end
end
