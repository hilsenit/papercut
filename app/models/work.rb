class Work < ApplicationRecord
  belongs_to :theme
  has_many :news, dependent: :destroy
  enum category: [:laes, :se, :hoer]

  validates_presence_of :title
end
