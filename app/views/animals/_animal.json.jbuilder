json.extract! animal, :id, :species, :kingdom, :numlegs, :created_at, :updated_at
json.url animal_url(animal, format: :json)
