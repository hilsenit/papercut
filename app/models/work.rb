class Work < ApplicationRecord
  belongs_to :theme
  has_many :timelines #news
  enum category: [:laes, :se, :hoer]

  validates_presence_of :title
end
