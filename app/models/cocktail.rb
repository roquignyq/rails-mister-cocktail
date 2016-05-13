class Cocktail < ActiveRecord::Base
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, uniqueness: true, presence: true
  mount_uploader :photo, PhotoUploader

  scope :search, ->(term) { where("name iLIKE ? ", "%#{term}%") }

end
