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
    
    clean_db(Line) # let's erase everyone from the db
    
    cities_files = ['lib/datasets/giros_chalco.csv', 'lib/datasets/giros_metepec.csv']
    
    cities_files.each do |city_file|
      CSV.foreach(city_file, :headers => true, :encoding => 'ISO-8859-1:UTF-8') do |row|
        city = Municipio.find_by(nombre: row.to_hash['municipio_id'])
        name = row.to_hash['nombre']
        description = row.to_hash['descripcion']
      
        if city.present? && row_does_not_exist_in_the_db(Line, { nombre: name, municipio: city })
          Line.create(nombre: name, descripcion: description , municipio: city)
        end
      end
    end
  end
  
  desc "Load dependencies to the db"
  task :load_dependencies  => :environment do |t, args| 
      
    clean_db(Dependecy) # let's erase everyone from the db
    
    cities_files = ['lib/datasets/dependencias_chalco.csv', 'lib/datasets/dependencias_metepec.csv']
    
    cities_files.each do |city_file|
      CSV.foreach(city_file, :headers => true, :encoding => 'ISO-8859-1:UTF-8') do |row|
        city = Municipio.find_by(nombre: row.to_hash['municipio_id'])
        name = row.to_hash['nombre']

        if city.present? && row_does_not_exist_in_the_db(Dependency, { nombre: name, municipio: city })
          Dependency.create(nombre: name, municipio: city)
        end
      end
    end
  end
  
  desc "Load inspectors to the db"
  task :load_inspectors  => :environment do |t, args| 
    
    cities_files = ['lib/datasets/notificadores_chalco.csv', 'lib/datasets/notificadores_metepec.csv']
    
    clean_db(Inspector) # let's erase everyone from the db
    
    cities_files.each do |city_file|
      # init variables
      number_of_successfully_created_rows = 0
      CSV.foreach(city_file, :headers => true, :encoding => 'ISO-8859-1:UTF-8') do |row|
        
        dependency = Dependency.find_by(nombre: row.to_hash['dependency_name'])
        name = row.to_hash['nombre']
        valid_through = row.to_hash['vigencia']
        subject = row.to_hash['materia']
        supervisor = row.to_hash['supervisor']
        contact = row.to_hash['contacto']
        photo = row.to_hash['foto']

        if dependency.present? && row_does_not_exist_in_the_db(Inspector, { 
            nombre: name,
            dependency: dependency,
            materia: subject
          })
          Inspector.create!(
             dependency: dependency,
             nombre: name,
             vigencia: valid_through,
             materia: subject,
             supervisor: supervisor,
             contacto: contact,
             foto: photo
          )
          number_of_successfully_created_rows = number_of_successfully_created_rows + 1
        else
            puts "#{name} | #{valid_through} | #{subject} | #{supervisor} | #{contact} | #{photo} | #{}"
        end
        
      end
      puts "Number of successfully created rows is (#{city_file}): #{number_of_successfully_created_rows}"
    end
  end
  
  desc "Load requirements to the db"
  task :load_requirements  => :environment do |t, args| 
      
    clean_db(Requirement) # let's erase everyone from the db
    
    cities_files = ['lib/datasets/requisitos_chalco.csv', 'lib/datasets/requisitos_metepec.csv']
    
    cities_files.each do |city_file|
      # init variables
      number_of_successfully_created_rows = 0
      CSV.foreach(city_file, :headers => true, :encoding => 'ISO-8859-1:UTF-8') do |row|
        city = Municipio.find_by(nombre: row.to_hash['municipio'])
        name = row.to_hash['nombre']
        description = row.to_hash['descripcion']
        path = row.to_hash['path']

        row_values = { nombre: name, municipio: city, descripcion: description, path: path }
        if city.present? && row_does_not_exist_in_the_db(Requirement, row_values)
          Requirement.create!(row_values)
          number_of_successfully_created_rows = number_of_successfully_created_rows + 1
        else
          puts "#{row_values.inspect}"
        end
      end
      puts "Number of successfully created rows is (#{city_file}): #{number_of_successfully_created_rows}"
    end
  end
  
  desc "Load inspections to the db"
  task :load_inspections  => :environment do |t, args| 
    
    cities_files = ['lib/datasets/notificaciones_chalco.csv', 'lib/datasets/notificaciones_metepec.csv']
    
    clean_db(Inspection) # let's erase everyone from the db
    
    cities_files.each do |city_file|
      # init variables
      number_of_successfully_created_rows = 0
      CSV.foreach(city_file, :headers => true, :encoding => 'ISO-8859-1:UTF-8') do |row|
        
        dependency = Dependency.find_by(nombre: row.to_hash['dependency_name'])
        name = row.to_hash['nombre']
        subject = row.to_hash['materia']
        period = row.to_hash['duracion']
        norm = row.to_hash['norma']
        before_tips = row.to_hash['antes']
        during_tips = row.to_hash['durante']
        after_tips = row.to_hash['despues']
        sanctions = row.to_hash['sancion']
        certification = row.to_hash['documento_acredita']
        
        row_values = { 
          dependecy: dependency,
          nombre: name,
          materia: subject,
          duracion: period,
          norma: norm,
          antes: before_tips,
          durante: during_tips,
          despues: after_tips,
          sancion: sanctions,
          certification: certification
        }

        if dependency.present? && row_does_not_exist_in_the_db(Inspection, row_values)
          Inspection.create!(row_values)
          number_of_successfully_created_rows = number_of_successfully_created_rows + 1
        else
            puts "#{ row_values.inspect }"
        end
        
      end
      puts "Number of successfully created rows is (#{city_file}): #{number_of_successfully_created_rows}"
    end
  end
  
  def row_does_not_exist_in_the_db(model, search_values)
    !model.where(search_values).present?
  end
  
  def clean_db(model)
    model.delete_all
  end
end
