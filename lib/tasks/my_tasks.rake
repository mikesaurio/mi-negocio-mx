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


  desc "cargar giros chalco"
  task :giros_chalco  => :environment do |t, args| 
    CSV.foreach('lib/datasets/giros_chalco.csv', :headers => true, :encoding => 'ISO-8859-1:UTF-8') do |row|
      if row.to_hash['municipio_id']
        user
      end
    end
  end












def controllers(val)
 case val
    when 'Lines'    
     Line
    when  'FormationSteps'   
      FormationStep
     when  'Inspectors'   
      Inspector
    when 'Inspections'
      Inspection
    when 'Dependencies'
      Dependency
    else
      nil
  end
end

end
