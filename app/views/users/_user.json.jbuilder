json.extract! user, :id, :firstname, :lastname, :address, :city, :state, :zip, :email, :receiveemail, :profileimage, :created_at, :updated_at
json.url user_url(user, format: :json)
