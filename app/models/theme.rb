class Theme < ApplicationRecord
  mount_uploader :cover_image, CoverImageUploader

  has_many :works, dependent: :destroy
  has_many :sources, through: :works
  has_many :to_dos, through: :works

  default_scope { order(created_at: :desc) }

  validates_presence_of :title
end
