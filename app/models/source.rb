class Source < ApplicationRecord
  mount_uploader :image, SourceImageUploader
  belongs_to :work
end
