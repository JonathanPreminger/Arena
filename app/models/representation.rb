class Representation < ApplicationRecord
  belongs_to :show
  has_many :reservations

  validates :key, presence: true, uniqueness: true
end
