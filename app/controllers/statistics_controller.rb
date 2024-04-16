class StatisticsController < ActionController::Base
	def index
		@users_total = User.all.count
		@reservations_total = Reservation.all.count
	end
end