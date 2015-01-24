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

def controllers(val)
 case val
    when 'Lines'    
     Line
    when  'FormationSteps'   
      FormationSteps
     when  'Inspectors'   
      Inspectors
    when 'inspections'
      Inspections
    else
      nil
  end
end

end
