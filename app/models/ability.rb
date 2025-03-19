class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new  # Usuário não autenticado (guest)

    if user.admin?
      can :manage, :all  # Admin pode fazer tudo
    else
      can :read, Rental  # Usuário comum pode visualizar os empréstimos
      can :read, Boook  # Pode criar empréstimos
    end
  end
end
