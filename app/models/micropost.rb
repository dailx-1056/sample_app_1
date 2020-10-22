class Micropost < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  scope :order_by_created_at, ->{order created_at: :desc}
  scope :feed, ->(user_ids){where user_id: user_ids}

  delegate :name, to: :user, prefix: true

  validates :user_id, :content, presence: true,
    length: {maximum: Settings.micropost.max_length}
  validates :image, content_type: {
    in: Settings.micropost.type, message: I18n.t("invalid_image")
  }, size: {
    less_than: 5.megabytes, message: I18n.t("max_size_image")
  }

  def display_image
    image.variant resize_to_limit: [Settings.micropost.img_limit,
      Settings.micropost.img_limit]
  end
end
