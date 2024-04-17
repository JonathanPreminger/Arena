class StatisticsController < ActionController::Base
  def index
    @users_total = User.all.count
    @reservations_total = Reservation.all.count

    # Selected show
    @selected_show = params[:show]
    @reservations_total_for_selected_show = params[:reservations_total_for_selected_show]
    @users_total_for_selected_show = params[:users_total_for_selected_show]
    @average_age_for_selected_show = params[:average_age_for_selected_show]
    @average_price_for_selected_show = params[:average_price_for_selected_show]
  end

  def stats_per_show
    selected_show = params[:show]
    # Count of the reservations per selected show
    representations_for_selected_show = Show.find_by(name: selected_show).representations
    reservations_for_selected_show = representations_for_selected_show.each_with_object([]) do |representation, array|
      array << representation.reservations
      array.flatten
    end

    reservations_total_for_selected_show = reservations_for_selected_show.flatten.count

    # Count of the users per selected show
    users_for_selected_show = reservations_for_selected_show.flatten.each_with_object([]) do |reservation, array|
      array << reservation.user
      array
    end
    
    users_total_for_selected_show = users_for_selected_show.uniq.count

    # Average age per selected show
    user_with_age = users_for_selected_show.reject { |user| user.age.nil? }
    average_age_for_selected_show = user_with_age.inject(0){ |sum, user| sum + user.age } / user_with_age.count
    
    # Average price per selected show
    tickets_total_for_selected_show = reservations_for_selected_show.flatten.each_with_object([]) do |reservation, array| 
      array << reservation.tickets
    end.flatten

    average_price_for_selected_show = 
      (tickets_total_for_selected_show.inject(0){ |sum, ticket| sum + ticket.price } / (tickets_total_for_selected_show.count.nonzero? || 1)).round(2)

    redirect_to root_path(show: selected_show, 
                          reservations_total_for_selected_show: reservations_total_for_selected_show,
                          users_total_for_selected_show: users_total_for_selected_show,
                          average_age_for_selected_show: average_age_for_selected_show,
                          average_price_for_selected_show: average_price_for_selected_show
                        )
  end
end