class Theme < ApplicationRecord
  mount_uploader :cover_image, CoverImageUploader
  has_many :works
end
