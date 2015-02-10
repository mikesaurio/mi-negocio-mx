class Line < ActiveRecord::Base

  has_many :procedure_lines
  has_many :procedures, through: :procedure_lines

  has_many :inspection_lines
  has_many :inspections, through: :inspection_lines

 belongs_to :municipio



 def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << ["nombre", "descripcion","municipio_id"]#column_names
      all.each do |product|
        csv << [product.nombre,product.descripcion, Municipio.find(product.municipio_id).nombre] 
      end
    end
  end

end
