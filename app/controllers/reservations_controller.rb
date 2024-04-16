class ReservationsController < ActionController::Base
	require 'csv'
	def index
	end

	def import
		file = params[:file]
		return redirect_to reservations_path unless file.content_type == "text/csv"

		ImportReservationsService.new.call(file)
		
		redirect_to reservations_path
	end
end