class Rental < ApplicationRecord
  # enum rental_status: { ativo: 0, devolvido: 1, devolvido_atraso: 2 }

  belongs_to :user # Aqui deveria ser has_many, não?
  belongs_to :book # Aqui deveria ser has_many, não?

  before_create :set_default_status

  # Método para verificar se o livro foi devolvido após o prazo
  def update_status_on_return
    return unless return_date.present?

    self.rental_status = return_date > return_estimate_date ? "devolvido com atraso" : "devolvido"
    save
  end

  def extend_return_estimate_date
    if Date.today <= return_estimate_date
      self.return_estimate_date += 20.days
      save
    else
      errors.add(:base, "Não é possível prolongar o prazo após a data estimada de devolução")
      false
    end
  end

  def rental_status_class
    case rental_status
    when "ativo"
      "bg-success"  # Verde para ativo
    when "devolvido"
      "bg-primary"  # Azul para devolvido
    when "devolvido_atraso"
      "bg-danger"   # Vermelho para devolvido com atraso
    else
      "bg-secondary" # Cinza para outros casos
    end
  end


  private

  # Definir o status padrão corretamente
  def set_default_status
  self.rental_status = "ativo"
  end
end
