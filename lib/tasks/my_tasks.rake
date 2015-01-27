namespace :my_tasks do
 require 'csv'   

  desc "Importa CSV formation steps a la BD"
  task :import_csv,  [:first_param, :second_param] => :environment do |t, args|   
    file = args[:first_param]
    @controlador = controllers(args[:second_param])
    CSV.foreach(file, :headers => true) do |row|
      @controlador.create!(row.to_hash)
    end
  end
  
  desc "Create a new line only if there's a city match"
  task :load_lines  => :environment do |t, args| 
    
    cities_lines_files = ['lib/datasets/giros_chalco.csv', 'lib/datasets/giros_metepec.csv']
    
    cities_lines_files.each do |city_file|
      CSV.foreach(city_file, :headers => true, :encoding => 'ISO-8859-1:UTF-8') do |row|
        city = Municipio.find_by(nombre: row.to_hash['municipio_id'])
        name = row.to_hash['nombre']
        description = row.to_hash['descripcion']
      
        if city.present? && row_does_not_exist_in_the_db(Line, name, city)
          Line.create(nombre: name, descripcion: description , municipio: city)
        end
      end
    end
  end
  
  def row_does_not_exist_in_the_db(model, name, city)
    !model.where(nombre: name, municipio: city).present?
  end

end
