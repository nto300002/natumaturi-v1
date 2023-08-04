class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :flyer
  validates :content, presence: true, length: { maximum: 255 }
end
