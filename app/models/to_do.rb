class ToDo < ApplicationRecord
  mount_uploader :image, SourceImageUploader
  validates_presence_of :title
  belongs_to :work

  default_scope { order(created_at: :asc) }
end
