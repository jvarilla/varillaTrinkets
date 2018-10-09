json.extract! supplier, :id, :suppliername, :address, :phone, :email, :notes, :created_at, :updated_at
json.url supplier_url(supplier, format: :json)
