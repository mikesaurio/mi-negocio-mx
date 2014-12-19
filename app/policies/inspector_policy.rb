class InspectorPolicy < ApplicationPolicy
  # def create?
  #   true
  # end
  #
  # def new?
  #   create?
  # end
  #
  # def update?
  #   true
  # end
  #
  # def edit?
  #   update?
  # end

  class Scope < Scope
    def resolve
      scope
    end

  end
end
