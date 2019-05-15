class Gig < ApplicationRecord
  belongs_to :user
  validates :title, presence: {message: "Title is needed"} 
  

  has_many :sites
end
