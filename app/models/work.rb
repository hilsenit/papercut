class Work < ApplicationRecord
  belongs_to :theme
  enum category: [:laes, :se, :hoer]
end
