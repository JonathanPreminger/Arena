class Representation < ApplicationRecord
  belongs_to :show
  has_many :reservations

  validates :key, presence: true, uniqueness: true

  def reservations_count
    reservations.count
  end

  def average_price 
    tickets_by_representation = reservations.each_with_object([]) do |reservation, array| 
      array << reservation.tickets
    end.flatten

    average_price_by_representation = 
      (tickets_by_representation.inject(0){ |sum, ticket| sum + ticket.price } / (tickets_by_representation.count.nonzero? || 1)).round(2)
  end
end
