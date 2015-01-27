class FormationStep < ActiveRecord::Base
    self.inheritance_column = nil

      belongs_to :municipio

      scope :by_city, -> (city) { where(municipio: city) }
end
