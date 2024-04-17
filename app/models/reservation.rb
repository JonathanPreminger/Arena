class Reservation < ApplicationRecord
  belongs_to :representation
  belongs_to :user
  has_many :tickets

  validates :number, presence: true, uniqueness: true
end
