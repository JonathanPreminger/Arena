class Show < ApplicationRecord
  has_many :representations

  validates :name, presence: true, uniqueness: true
end
