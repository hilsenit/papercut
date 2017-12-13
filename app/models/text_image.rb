class TextImage < ApplicationRecord
  mount_uploader :file, TextImageUploader
end
