class User < ApplicationRecord
  has_many :reservations

  validates :last_name, presence: true, uniqueness: true

  scope :with_age, -> { where.not(age: nil) }

  def self.average_age
		User.with_age.sum(:age) / (User.with_age.count.nonzero? || 1) 
  end
end
