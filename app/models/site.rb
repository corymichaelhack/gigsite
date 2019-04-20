class Site < ApplicationRecord
  belongs_to :gig
  has_many :notes
end
