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
genres = 8.times.map do
  Genre.create!(
    name: Faker::Book.genre,
    description: Faker::Lorem.sentence(word_count: 10)
  )
end

# Criando livros fake e associando a autores e gêneros
book_titles = Set.new # Usado para garantir títulos únicos
books = 50.times.map do
  title = Faker::Book.title
  while book_titles.include?(title)
    title = Faker::Book.title # Regenera o título se já existir
  end
  book_titles.add(title)

  Book.create!(
    title: title,  # Título único
    publisher: Faker::Book.publisher,
    year_published: Faker::Number.between(from: 1800, to: 2024),
    shelf: "#{('A'..'Z').to_a.sample}#{rand(1000..7000)}",  # Prateleira com a letra de A-Z
    quanty: rand(1..20)
  )
end

# Criando 10 usuários mockados
user_registrations = Set.new # Usado para garantir matrículas únicas
users = 10.times.map do
  registration = Faker::Number.number(digits: 8).to_s
  while user_registrations.include?(registration)
    registration = Faker::Number.number(digits: 8).to_s # Regenera a matrícula se já existir
  end
  user_registrations.add(registration)

  User.create!(
    name: Faker::Name.name,
    habilitaded: true,
    registration: registration,  # Matrícula única
    email: Faker::Internet.unique.email,
    password: "password" # Senha padrão para testes
  )
end

# Associando 1 ou 2 autores ao livro
books.each do |book|
  book.authors << authors.sample(rand(1..2))

  # Associando 1 ou 2 gêneros ao livro
  book.genres << genres.sample(rand(1..2))
end
