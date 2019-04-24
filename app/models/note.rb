class Note < ApplicationRecord
  belongs_to :site

  mount_uploader :image, ImageUploader
end
