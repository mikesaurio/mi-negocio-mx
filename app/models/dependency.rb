class Dependency < ActiveRecord::Base
  belongs_to :municipio

  has_many :procedures
  has_many :inspectors
  has_many :inspections

  scope :by_city, -> (city) { where(municipio: city) }



  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << ["nombre", "municipio"]#column_names
      all.each do |product|
        csv << [product.nombre,product.municipio.nombre] 
      end
    end
  end
end
