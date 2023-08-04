class Flyer < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PictureUploader
  mount_uploader :item_image, ItemImageUploader
  has_many :comments
  has_many :bookmarks
  has_many :users, through: :bookmarks

  validates :title, presence: true, length: { maximum: 30 }
  validates :requirement, presence: true, length: { maximum: 100 }
  validates :searching_for, presence: true, length: { maximum: 125 }
  validates :gathering_place, presence: true, length: { maximum: 100 }
  validates :picture, presence: true

  acts_as_taggable_on :tags # This line enables tagging
  def process_image(user_uploaded_image_path)
    require 'mini_magick'

    # 画像に画像を挿入
    image_path = Rails.root.join('app', 'assets', 'images', 'sample.png')
    main_image = MiniMagick::Image.open(image_path)
    main_image_copy = main_image.dup
    overlay_image = MiniMagick::Image.open(user_uploaded_image_path)
    overlay_image.format('png')
    overlay_image.resize "716x500"

    result_image = main_image_copy.composite(overlay_image) do |c|
      c.gravity 'NorthWest' # 左上隅を基準に座標を指定する
      c.geometry "+41+132"  # x座標とy座標を指定
    end

    # 画像に文字列を挿入
    result_image.combine_options do |c|
      c.gravity "Center"
      c.pointsize "50"
      c.font Rails.root.join('app', 'assets', 'fonts', 'Nasu-Regular-20200227.ttf').to_s
      c.fill "black"
    end

    # 結果の画像を保存
    result_image_path = Rails.root.join('tmp', 'final_image.png')
    result_image.write result_image_path

    # Flyerオブジェクトのbackground_imageに結果の画像をセット
    File.open(result_image_path) do |file|
      self.item_image = file
    end
  end
end
