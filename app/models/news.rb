class News < ApplicationRecord
  belongs_to :work
  validates_presence_of :title
end
