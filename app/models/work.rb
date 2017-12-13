class Work < ApplicationRecord
  attr_accessor :theme_title
  mount_uploader :cover_image, WorkCoverUploader
  mount_uploader :share_image, ShareImageUploader
  enum category: [:laes, :se, :hoer]

  belongs_to :theme
  has_many :news, dependent: :destroy
  has_many :sources, inverse_of: :work

  accepts_nested_attributes_for :sources, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :title

  default_scope { order(created_at: :asc) }
end
