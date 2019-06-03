class Note < ApplicationRecord
  belongs_to :site
  validates :body, presence: { 
                    message: "Note can not be blank"},length: {
                        minimum: 2, 
                          too_short: "%{count} characters is the minimum allowed", 
                          maximum: 1000, 
                            too_long: "%{count} characters is the maximum allowed" }

  mount_uploader :image, ImageUploader
end
