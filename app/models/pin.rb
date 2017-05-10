class Pin < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, :url, :slug, :text, :category_id
  validates_uniqueness_of :slug
  belongs_to :category
#  mount_uploader :image, ImageUploader
  has_attached_file :image, styles: { medium: "300x300", thumb: "75x75" },
  default_url: "http://placebear.com/200/300"
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end