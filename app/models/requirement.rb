class Requirement < ActiveRecord::Base

  has_many :procedure_requirements
  has_many :procedures, through: :procedure_requirements

  has_many :inspection_requirements
  has_many :inspections, through: :inspection_requirements

 belongs_to :municipio

 
       def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << ["nombre", "descripcion","path","municipio"]#column_names
      all.each do |product|
        csv << [product.nombre,product.descripcion, product.path , product.municipio.nombre] 
      end
    end
  end
end
