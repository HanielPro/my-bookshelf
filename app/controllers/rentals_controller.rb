class RentalsController < ApplicationController
  before_action :set_rental, only: %i[ show edit update destroy ]

  # GET /rentals or /rentals.json
  def index
    @rentals = Rental.all
  end

  # GET /rentals/1 or /rentals/1.json
  def show
  end

  # GET /rentals/new
  def new
    @rental = Rental.new
    @books = Book.where(available: true)  # Lista apenas livros disponíveis
  end

  # GET /rentals/1/edit
  def edit
  end
  def create
    puts "Params: #{params.inspect}"  # Adicione essa linha para verificar os parâmetros

    @rental = Rental.new(rental_params)
    book = Book.find(@rental.book_id)
    user = User.find(@rental.user_id)

    # Verificando se o usuário já possui o livro emprestado
    if Rental.exists?(user: user, book: book, rental_status: "ativo")
      respond_to do |format|
        format.html { redirect_to rentals_path, alert: "esse livro já foi emprestado para este usuário." }
        format.json { render json: { error: "Você esse livro já foi emprestado para este usuário." }, status: :unprocessable_entity }
      end
      return
    end

    respond_to do |format|
      if book.available?
        book.update(quanty: book.quanty - 1)  # Diminui a quantidade disponível do livro
        if @rental.save
          format.html { redirect_to @rental, notice: "Empréstimo salvo com sucesso" }
          format.json { render :show, status: :created, location: @rental }
          return
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @rental.errors, status: :unprocessable_entity }
          return
        end
      else
        format.html { render :new, notice: "Livro Não Disponível." }
        format.json { render json: { error: "Livro Não Disponível" }, status: :unprocessable_entity }
        return
      end
    end



    respond_to do |format|
      if @rental.save
        format.html { redirect_to @rental, notice: "Empréstimo salvo com sucesso" }
        format.json { render :show, status: :created, location: @rental }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rentals/1 or /rentals/1.json
  def update
    respond_to do |format|
      if @rental.update(rental_params)
        format.html { redirect_to @rental, notice: "Empréstimo atualizado com sucesso" }
        format.json { render :show, status: :ok, location: @rental }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rentals/1 or /rentals/1.json
  def destroy
    @rental.destroy!

    respond_to do |format|
      format.html { redirect_to rentals_path, status: :see_other, notice: "Empréstimo excluído com sucesso" }
      format.json { head :no_content }
    end
  end


  def return_rental
    @rental = Rental.find(params[:id])  # Encontra o aluguel com base no ID
    if @rental.return_date.nil?  # Se o livro ainda não foi devolvido
      @rental.update(return_date: Time.current)  # Registra a data de devolução
      @rental.update_status_on_return  # Atualiza o status com base na data de devolução
      book = @rental.book
      book.update(quanty: book.quanty + 1)  # Aumenta a quantidade de cópias do livro
      redirect_to rentals_path, notice: "Livro devolvido com sucesso!"
    else
      redirect_to rentals_path, alert: "Este livro já foi devolvido."
    end
  end

  # Ação para prolongar o prazo de devolução
  def extend_return_date
    @rental = Rental.find(params[:id])

    # Verifica se a data atual é menor ou igual à data de devolução
    if @rental.return_estimate_date >= Date.today
      if @rental.extend_return_estimate_date
        redirect_to rentals_path, notice: "Prazo de devolução prolongado por 20 dias."
      else
        redirect_to rentals_path, alert: "Erro ao prolongar o prazo de devolução."
      end
    else
      redirect_to rentals_path, alert: "O prazo de devolução já expirou, não é possível prolongá-lo."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental
      @rental = Rental.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rental_params
      params.require(:rental).permit(:book_id, :user_id, :rental_date, :return_estimate_date)
    end
end
