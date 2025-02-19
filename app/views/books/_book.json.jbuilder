json.extract! book, :id, :title, :publisher, :publication_year, :shelf, :quanty, :created_at, :updated_at
json.url book_url(book, format: :json)
