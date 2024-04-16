class Reservation < ApplicationRecord
  belongs_to :representation
  belongs_to :user
  has_many :tickets

  validates :number, presence: true, uniqueness: true

  def price
    representation.price
  end

  def self.average_price
		(Reservation.all.inject(0){ |sum, reservation| sum + reservation.price } / (Reservation.all.count.nonzero? || 1)).round(2)
  end
end
