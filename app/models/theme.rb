class Theme < ApplicationRecord
  mount_uploader :cover_image, CoverImageUploader
  has_many :works, dependent: :destroy
  validates_presence_of :title
  default_scope { order(created_at: :desc) }
end
