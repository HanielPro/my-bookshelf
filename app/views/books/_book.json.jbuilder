json.extract! book, :id, :title, :publisher, :year_published, :shelf, :quanty, :created_at, :updated_at
json.url book_url(book, format: :json)
