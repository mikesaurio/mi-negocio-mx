class PagesController < ApplicationController
 layout 'paginas'

 def quiere
   @titulo = "¿Qué quieres saber?"
   @subtitulo= "Encuentra toda la información para tu negocio"
   @param = params[:municipio]
   $id_del_municipio = @param[:municipio_id]
 end

 def encuesta
  @titulo = 'Encuesta de entrada'
 end

 def paso
  @param_paso = params[:lines]
  $id_del_giro = @param_paso[:line_id]
  @subtitulo = "Para tu negocio  de  #{Line.find($id_del_giro).nombre} necesitas"
  @tramites_del_giro = Line.find($id_del_giro).procedures.includes(:procedure_lines).where("line_id = #{$id_del_giro}")


end


def nuevo
  @titulo = "¿Qué quieres saber?"
  @subtitulo= "Encuentra toda la información para tu negocio"
  @param = params[:municipio]
  $id_del_municipio = @param[:municipio_id]
end

def tramite
 @titulo = Municipio.find($id_del_municipio).nombre    
end

def tramites_giro(num)
  Procedure.find(num).requirements.includes(:procedure_requirements).where("procedure_id = #{num}")
end
helper_method :tramites_giro

end

