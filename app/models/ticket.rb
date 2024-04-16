class Ticket < ApplicationRecord
  belongs_to :reservation

  validates :number, presence: true, uniqueness: true
end
