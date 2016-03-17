class Image < ActiveRecord::Base
  belongs_to :user

  mount_uploader :picture, ImageUploader

  validates :width, numericality: {
                      only_integer: true,
                      greater_than: 0 ,
                      allow_blank: true }

  validates :height, numericality: { only_integer: true,
                                     greater_than: 0,
                                     allow_blank: true }

  validates :picture, presence: true
  validates :user_id, presence: true

  def resize
    image = MiniMagick::Image.open(picture.current_path)
    image.resize "#{width || ''}x#{height || ''}"
  end
end
