class ImportReservationsService
  require 'csv'

  def call(file)
    file = File.open(file)
    csv = CSV.parse(file, headers: true, col_sep: ";")

    csv.each do |row|
      user_hash = {}
      user_hash[:last_name] = row["Nom"]
      user_hash[:first_name] = row["Prenom"]
      user_hash[:sexe] = row["Sexe"]
      user_hash[:age] = row["Age"]
      user_hash[:email] = row["Email"]
      user_hash[:address] = row["Address"]
      user_hash[:postal_code] = row["Code postal"]
      user_hash[:country] = row["Pays"]

      show_hash = {}
      show_hash[:key] = row["Cle spectacle"]
      show_hash[:name] = row["Spectacle"]

      representation_hash = {}
      representation_hash[:key] = row["Cle representation"]
      representation_hash[:name] = row["Representation"]
      representation_hash[:start_date] = row["Date representation"]
      representation_hash[:end_date] = row["Date fin representation"]
      representation_hash[:start_time] = row["Heure representation"]
      representation_hash[:end_time] = row["Heure fin represnetation"]
      representation_hash[:price] = row["Prix"]

      reservation_hash = {}
      reservation_hash[:number] = row["Reservation"]
      reservation_hash[:date] = row["Date reservation"]
      reservation_hash[:time] = row["Heure reservation"]
      reservation_hash[:product_type] = row["Type de produit"]
      reservation_hash[:sales_channel] = row["Filiere de vente"]

      ticket_hash = {}
      ticket_hash[:number] = row["Numero billet"]

      user = User.create(user_hash)
      show = Show.create(show_hash)

      representation_hash[:show_id] = show.id || Show.find_by(name: show_hash[:name]).id
      representation = Representation.create(representation_hash)

      reservation_hash[:representation_id] = representation.id || Representation.find_by(key: representation_hash[:key]).id
      reservation_hash[:user_id] = user.id || User.find_by(last_name: user_hash[:last_name]).id
      reservation = Reservation.create(reservation_hash)

      ticket_hash[:reservation_id] = reservation.id || Reservation.find_by(number: reservation_hash[:number]).id
      Ticket.create(ticket_hash)
    end
  end
end