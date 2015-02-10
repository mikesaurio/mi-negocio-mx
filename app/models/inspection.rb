class Inspection < ActiveRecord::Base
  belongs_to :dependency

  has_many :inspection_lines
  has_many :lines, through: :inspection_lines
  has_many :inspection_requirements
  has_many :requirements, through: :inspection_requirements

  scope :by_city,
    -> (city) {
      includes(:dependency).
      where(dependencies: { municipio_id: city.id })
    }

  scope :search_by_city,
    -> (city, query) {
      by_city(city).
      where("inspections.nombre ILIKE ?", "%#{query}%")
    }


def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << ["nombre","materia","duracion", "norma","antes","durante","despues","sancion","dependencia","giros","requerimientos"]#column_names
      all.each do |product|
        csv << [
          product.nombre,
          product.materia,
          product.duracion,
          product.norma,
          product.antes,
          product.durante,
          product.despues,
          product.sancion,
          Dependency.find(product.dependency_id).nombre,
          inspection_lines(product.id),
          inspection_requirements(product.id)] 
        end
      end
    end
  end



  def inspection_lines(id_inspection)
    aux = []
    InspectionLine.where(inspection_id: id_inspection).each_with_index do |line, index|
      aux[index] = Line.find(line.line_id).nombre
    end
    if aux.blank?
      'N/A' 
    else
      aux.map(&:inspect).join('; ').gsub /"/, ''
    end
  end


def inspection_requirements(id_inspection)
  aux = []
  InspectionRequirement.where(inspection_id: id_inspection).each_with_index do |requirement, index|
    aux[index] = Requirement.find(requirement.requirement_id).nombre
  end
  if aux.blank?
    'N/A' 
  else
    aux.map(&:inspect).join('; ').gsub /"/, ''
  end
end


