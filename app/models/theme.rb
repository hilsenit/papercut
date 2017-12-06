class Theme < ApplicationRecord
  mount_uploader :cover_image, CoverImageUploader

  has_many :works, dependent: :destroy
  default_scope { order(created_at: :desc) }

  validates_presence_of :title
end
