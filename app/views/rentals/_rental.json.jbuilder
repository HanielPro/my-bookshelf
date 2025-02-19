json.extract! rental, :id, :rental_date, :return_date, :return_estimate_date, :created_at, :updated_at
json.url rental_url(rental, format: :json)
