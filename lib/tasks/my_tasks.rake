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
  
  desc "Load lines to the db"
  task :load_lines  => :environment do |t, args| 
    
    cities_lines_files = ['lib/datasets/giros_chalco.csv', 'lib/datasets/giros_metepec.csv']
    
    cities_lines_files.each do |city_file|
      CSV.foreach(city_file, :headers => true, :encoding => 'ISO-8859-1:UTF-8') do |row|
        city = Municipio.find_by(nombre: row.to_hash['municipio_id'])
        name = row.to_hash['nombre']
        description = row.to_hash['descripcion']
      
        if city.present? && row_does_not_exist_in_the_db(Line, { nombre: name, municipio: city})
          Line.create(nombre: name, descripcion: description , municipio: city)
        end
      end
    end
  end
  
  desc "Load dependencies to the db"
  task :load_dependencies  => :environment do |t, args| 
    
    cities_lines_files = ['lib/datasets/dependencias_chalco.csv', 'lib/datasets/dependencias_metepec.csv']
    
    cities_lines_files.each do |city_file|
      CSV.foreach(city_file, :headers => true, :encoding => 'ISO-8859-1:UTF-8') do |row|
        city = Municipio.find_by(nombre: row.to_hash['municipio_id'])
        name = row.to_hash['nombre']

        if city.present? && row_does_not_exist_in_the_db(Dependency, { nombre: name, municipio: city})
          Dependency.create(nombre: name, municipio: city)
        end
      end
    end
  end
  
  def row_does_not_exist_in_the_db(model, search_values)
    !model.where(search_values).present?
  end

end
