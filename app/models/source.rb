class Source < ApplicationRecord
  mount_uploader :image, SourceImageUploader
  belongs_to :work

  default_scope { order(created_at: :asc) }
end
