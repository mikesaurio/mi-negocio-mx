class PagesController < ApplicationController
 layout 'blanco'

 def quiere
   @titulo = "¿Qué quieres saber?"
   @subtitulo= "Encuentra toda la información para tu negocio"
   @param = params[:municipio]
   $id_del_municipio = @param[:municipio_id]
   $nombre_municipio = Municipio.find($id_del_municipio).nombre
 end

 def encuesta
  @titulo = 'Encuesta de entrada'
 end

 def paso
  @tramites_del_giro = Line.all
  #@param_paso = params[:lines]
  #$id_del_giro = @param_paso[:line_id]
  #@subtitulo = "Para tu negocio  de  #{Line.find($id_del_giro).nombre} necesitas"
 # @tramites_del_giro = Line.find($id_del_giro).procedures.includes(:procedure_lines).where("line_id = #{$id_del_giro}")
end


def nuevo_negocio
  @titulo_fisico = "Crear un negocio como persona fisica"
  @titulo_moral = "Crear un negocio como persona moral"
end

def tramite
 @titulo = Municipio.find($id_del_municipio).nombre    
end

def tramites_giro(num)
  Procedure.find(num).requirements.includes(:procedure_requirements).where("procedure_id = #{num}")
end


def inspec
@inspections = Inspection.all
 if params[:q]
      @inspectors = Inspector.search(params[:q]).order("created_at DESC")
    else
      @inspectors = Inspector.all
    end

    @dependency = Dependency.all
end 





helper_method :tramites_giro

end

