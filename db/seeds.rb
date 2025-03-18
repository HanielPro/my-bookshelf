require 'faker'

# Limpando dados antigos (CUIDADO EM PRODUÇÃO)
Publication.destroy_all
Category.destroy_all
Book.destroy_all
Author.destroy_all
Genre.destroy_all
User.destroy_all



# Criando autores fake
authors = 10.times.map do
  Author.create!(
    name: Faker::Book.author,
    birthdate: Faker::Date.birthday(min_age: 25, max_age: 90)
  )
end

# Criando gêneros fake
genres = 5.times.map do
  Genre.create!(
    name: Faker::Book.genre,
    description: Faker::Lorem.sentence(word_count: 10)
  )
end

# Criando livros fake e associando a autores e gêneros
books = 30.times.map do
  book = Book.create!(
    title: Faker::Book.title,
    publisher: Faker::Book.publisher,
    year_published: Faker::Number.between(from: 1800, to: 2024),
    shelf: "A#{rand(1000..7000)}",
    quanty: rand(1..20)
  )

# Criando 20 usuários mockados
users = 20.times.map do
  User.create!(
    name: Faker::Name.name,
    habilitaded: true,
    registration: Faker::Number.number(digits: 8), # Matrícula com 8 dígitos
    email: Faker::Internet.unique.email,
    password: "password" # Senha padrão para testes
  )
end

  # Associando 1 ou 2 autores ao livro
  book.authors << authors.sample(rand(1..2))

  # Associando 1 ou 2 gêneros ao livro
  book.genres << genres.sample(rand(1..2))

  book
end
