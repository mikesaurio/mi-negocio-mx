class FormationStepPolicy < ApplicationPolicy
  def create?
    true
   # record.dependency.municipio_id == user.municipio_id && user.admin?
  end

  # def new?
  #   create?
  # end

  def update?
    create?
  end

  # def edit?
  #   update?
  # end

  def destroy?
    create?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
