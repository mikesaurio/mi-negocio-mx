class Inspector < ActiveRecord::Base
  belongs_to :dependency

  scope :by_city,
    -> (city) {
      includes(:dependency).
      where(dependencies: { municipio_id: city.id })
    }

  scope :search_by_city,
    -> (city, query) {
       by_city(city).
       where("inspectors.nombre ILIKE ?", "%#{query}%")
     }



 def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << ["nombre","vigencia","materia", "supervisor","contacto","foto","dependencia_id"]#column_names
      all.each do |product|
        csv << [product.nombre, product.vigencia, product.materia,product.supervisor, product.contacto, product.foto,Dependency.find(product.dependency_id).nombre] 
        end
      end
    end
  end

