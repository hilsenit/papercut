class Work < ApplicationRecord
  belongs_to :theme
  enum category: [:laes, :se, :hoer]

  validates_presence_of :title
end
