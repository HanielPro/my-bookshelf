class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]
  before_action :load_authors, only: %i[new edit create update]
  before_action :load_genres, only: %i[new edit create update]

  def index
    @books = Book.includes(:authors, :genres).all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book, notice: "Livro adicionado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: "Livro atualizado com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy!
    redirect_to books_path, notice: "Livro removido com sucesso!", status: :see_other
  end

  def search
    book = Book.includes(:authors, :genres).where("title LIKE ?", "%#{params[:title]}%").first

    if book
      render json: {
        id: book.id,
        title: book.title,
        authors: book.authors.map(&:name),
        genres: book.genres.map(&:name),
        quanty: book.quanty
      }
    else
      render json: { error: "Livro não encontrado" }, status: :not_found
    end
  end
  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :publisher, :year_published, :shelf, :quanty, author_ids: [], genre_ids: [])
  end

  def load_authors
    @available_authors = Author.all
  end

  def load_genres
    @available_genres = Genre.all
  end
end
