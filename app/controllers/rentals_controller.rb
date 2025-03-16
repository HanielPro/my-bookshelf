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

  # POST /rentals or /rentals.json
  def create
    @rental = Rental.new(rental_params)
    @book = Book.find(@rental.book_id)

    respond_to do |format|
      if @rental.save
        format.html { redirect_to @rental, notice: "Empréstimo foi criado com sucesso." }
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
        format.html { redirect_to @rental, notice: "Rental foi atualizado com sucesso!" }
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
      format.html { redirect_to rentals_path, status: :see_other, notice: "Rental foi removido com sucesso!" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental
      @rental = Rental.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def rental_params
      params.require(:rental).permit(:book_id, :user)
      # Adiciona os campos manualmente
      rental_date = Date.today
      return_estimate_date = Date.today + 25.days
      { rental_date: rental_date, return_estimate_date: return_estimate_date }
    end
end
