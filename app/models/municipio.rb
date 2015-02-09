class Municipio < ActiveRecord::Base
  has_many :dependencies
  has_many :ilines
  has_many :users
  has_many :formation_steps
  has_many :requirements

def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |product|
      csv << product.attributes.values_at(*column_names)
    end
  end
end


end
